using System.Drawing.Imaging;

namespace Xenon2Modern;

public sealed class GameAssets : IDisposable
{
    public sealed record StageBackgroundMap(int Width, int Height, IReadOnlyList<ushort> Cells);

    private sealed class TextureField
    {
        private readonly byte[] _primary;
        private readonly byte[] _secondary;

        public TextureField(byte[] primary, byte[] secondary)
        {
            _primary = primary.Length == 0 ? [0] : primary;
            _secondary = secondary.Length == 0 ? [0] : secondary;
        }

        public byte Sample(int x, int y, int seed)
        {
            var i1 = Math.Abs((x * 37) + (y * 17) + (seed * 13)) % _primary.Length;
            var i2 = Math.Abs((x * 19) + (y * 53) + (seed * 29)) % _secondary.Length;
            var a = _primary[i1];
            var b = _secondary[i2];
            return (byte)((a * 3 + b * 2) / 5);
        }
    }

    private GameAssets(
        Bitmap player,
        Bitmap enemy,
        Bitmap bullet,
        Bitmap backgroundTile,
        Bitmap explosion,
        IReadOnlyList<Bitmap> itemIcons,
        BitmapFontAtlas? hudFont,
        IReadOnlyDictionary<int, IReadOnlyList<Bitmap>> stageBackgroundTiles,
        IReadOnlyDictionary<int, StageBackgroundMap> stageBackgroundMaps)
    {
        Player = player;
        Enemy = enemy;
        Bullet = bullet;
        BackgroundTile = backgroundTile;
        Explosion = explosion;
        ItemIcons = itemIcons;
        HudFont = hudFont;
        StageBackgroundTiles = stageBackgroundTiles;
        StageBackgroundMaps = stageBackgroundMaps;
    }

    public Bitmap Player { get; }

    public Bitmap Enemy { get; }

    public Bitmap Bullet { get; }

    public Bitmap BackgroundTile { get; }

    public Bitmap Explosion { get; }

    public IReadOnlyList<Bitmap> ItemIcons { get; }

    public BitmapFontAtlas? HudFont { get; }

    public IReadOnlyDictionary<int, IReadOnlyList<Bitmap>> StageBackgroundTiles { get; }

    public IReadOnlyDictionary<int, StageBackgroundMap> StageBackgroundMaps { get; }

    public static GameAssets LoadFromLegacyFiles(string assetRoot)
    {
        var catalog = LegacyAssetCatalog.Load(assetRoot);
        var dosSprites = GetBytes(catalog, "S1/SPRITES.VGA", "S2/SPRITES.VGA", "X2SPR.DAT");
        var dosMods = GetBytes(catalog, "S1/MODS.VGA", "S2/MODS.VGA", "GR.DAT");
        var dosWeapons = GetBytes(catalog, "X2WEAPS.DAT", "SHOP.DAT", "GR.DAT");
        var amigaCode = GetBytes(catalog, "amiga/disk1/Xenon2/DJ99", "amiga/disk1/Xenon2/Xenon2");

        var playerField = new TextureField(dosSprites, amigaCode);
        var enemyField = new TextureField(dosMods, amigaCode);
        var bulletField = new TextureField(dosWeapons, dosSprites);
        var backgroundField = new TextureField(dosMods, dosSprites);
        var explosionField = new TextureField(amigaCode, dosWeapons);

        var imported = SpriteImportLayer.LoadOverrides(assetRoot);
        try
        {
            var itemIcons = ExtractItemIcons(imported);
            var hudFont = ExtractHudFont(imported);
            var stageBackgroundTiles = LoadStageBackgroundTiles(catalog);
            var stageBackgroundMaps = LoadStageBackgroundMaps(catalog);

            var player = ApplyOverride(imported, "player", CreatePlayerSprite(playerField));
            var enemy = ApplyOverride(imported, "enemy", CreateEnemySprite(enemyField));
            var bullet = ApplyOverride(imported, "bullet", CreateBulletSprite(bulletField));
            var backgroundTile = ApplyOverride(imported, "background", CreateBackgroundTile(backgroundField));
            var explosion = ApplyOverride(imported, "explosion", CreateExplosionSprite(explosionField));

            return new GameAssets(
                player: player,
                enemy: enemy,
                bullet: bullet,
                backgroundTile: backgroundTile,
                explosion: explosion,
                itemIcons: itemIcons,
                hudFont: hudFont,
                stageBackgroundTiles: stageBackgroundTiles,
                stageBackgroundMaps: stageBackgroundMaps
            );
        }
        finally
        {
            foreach (var bitmap in imported.Values)
            {
                bitmap.Dispose();
            }
        }
    }

    public void Dispose()
    {
        Player.Dispose();
        Enemy.Dispose();
        Bullet.Dispose();
        BackgroundTile.Dispose();
        Explosion.Dispose();
        foreach (var icon in ItemIcons)
        {
            icon.Dispose();
        }
        HudFont?.Dispose();
        foreach (var tileSet in StageBackgroundTiles.Values)
        {
            foreach (var tile in tileSet)
            {
                tile.Dispose();
            }
        }
    }

    private static byte[] GetBytes(LegacyAssetCatalog catalog, params string[] preferredSuffixes)
    {
        foreach (var suffix in preferredSuffixes)
        {
            var match = catalog.Files.FirstOrDefault(file =>
                file.RelativePath.Replace('\\', '/').EndsWith(suffix, StringComparison.OrdinalIgnoreCase));
            if (match is not null)
            {
                return catalog.ReadBytes(match);
            }
        }

        // Deterministic fallback keeps the game running even if one asset file is missing.
        var fallback = new byte[4096];
        for (var i = 0; i < fallback.Length; i++)
        {
            fallback[i] = (byte)((i * 37) & 0xFF);
        }

        return fallback;
    }

    private static IReadOnlyDictionary<int, IReadOnlyList<Bitmap>> LoadStageBackgroundTiles(LegacyAssetCatalog catalog)
    {
        var result = new Dictionary<int, IReadOnlyList<Bitmap>>();
        for (var stage = 1; stage <= 5; stage++)
        {
            var mods = TryGetBytes(catalog, $"S{stage}/MODS.VGA");
            if (mods is null)
            {
                continue;
            }

            var sprites = TryGetBytes(catalog, $"S{stage}/SPRITES.VGA");
            var palette = LoadStagePalette(sprites);
            var tiles = DecodeModsTiles(mods, palette);
            if (tiles.Count > 0)
            {
                result[stage] = tiles;
            }
        }

        return result;
    }

    private static IReadOnlyDictionary<int, StageBackgroundMap> LoadStageBackgroundMaps(LegacyAssetCatalog catalog)
    {
        var result = new Dictionary<int, StageBackgroundMap>();

        for (var stage = 1; stage <= 5; stage++)
        {
            var mapBlob = TryGetBytes(catalog, $"S{stage}/MAP.CMP");
            if (mapBlob is null || mapBlob.Length < 8)
            {
                continue;
            }

            var entries = DecodeStageMapEntries(mapBlob);
            if (entries.Count == 0)
            {
                continue;
            }

            var mapWidth = InferMapWidth(entries.Count);
            if (mapWidth <= 0)
            {
                continue;
            }

            var mapHeight = (entries.Count + mapWidth - 1) / mapWidth;
            var totalCells = mapWidth * mapHeight;
            var cells = new ushort[totalCells];
            for (var i = 0; i < Math.Min(entries.Count, totalCells); i++)
            {
                cells[i] = entries[i];
            }

            result[stage] = new StageBackgroundMap(mapWidth, mapHeight, cells);
        }

        return result;
    }

    private static int InferMapWidth(int entryCount)
    {
        if (entryCount <= 0)
        {
            return 0;
        }

        var candidates = new[] { 20, 22, 24, 26, 28, 30, 32, 34, 36, 40 };
        var bestWidth = 24;
        var bestScore = int.MaxValue;

        foreach (var width in candidates)
        {
            var remainder = entryCount % width;
            var closenessBias = Math.Abs(width - 24);
            var score = (remainder * 10) + closenessBias;
            if (score < bestScore)
            {
                bestScore = score;
                bestWidth = width;
            }
        }

        return bestWidth;
    }

    private static List<ushort> DecodeStageMapEntries(byte[] mapBlob)
    {
        var data = mapBlob;
        if (TryDecodeByteRun1(mapBlob, out var decoded, out var consumed) &&
            consumed >= mapBlob.Length - 16 &&
            decoded.Length >= mapBlob.Length)
        {
            data = decoded;
        }

        var entries = new List<ushort>(data.Length / 2);
        for (var i = 0; i + 1 < data.Length; i += 2)
        {
            var attributes = data[i];
            var tileIndex = data[i + 1];
            entries.Add((ushort)((attributes << 8) | tileIndex));
        }

        return entries;
    }

    private static bool TryDecodeByteRun1(byte[] input, out byte[] output, out int consumed)
    {
        var decoded = new List<byte>(input.Length * 2);
        var i = 0;
        while (i < input.Length)
        {
            var control = unchecked((sbyte)input[i++]);
            if (control >= 0)
            {
                var count = control + 1;
                if (i + count > input.Length)
                {
                    break;
                }

                for (var n = 0; n < count; n++)
                {
                    decoded.Add(input[i + n]);
                }

                i += count;
                continue;
            }

            if (control == -128)
            {
                continue;
            }

            if (i >= input.Length)
            {
                break;
            }

            var value = input[i++];
            var repeatCount = 1 - control;
            for (var n = 0; n < repeatCount; n++)
            {
                decoded.Add(value);
            }
        }

        consumed = i;
        output = decoded.ToArray();
        return output.Length > 0;
    }

    private static byte[]? TryGetBytes(LegacyAssetCatalog catalog, string suffix)
    {
        var match = catalog.Files.FirstOrDefault(file =>
            file.RelativePath.Replace('\\', '/').EndsWith(suffix, StringComparison.OrdinalIgnoreCase));

        return match is null ? null : catalog.ReadBytes(match);
    }

    private static List<Color> LoadStagePalette(byte[]? spritesBlob)
    {
        var palette = new List<Color> { Color.Transparent };
        if (spritesBlob is not null)
        {
            for (var i = 0; i < Math.Min(18, spritesBlob.Length); i += 2)
            {
                var word = (spritesBlob[i] << 8) | spritesBlob[i + 1];
                var r = ((word >> 8) & 0x7) * 36;
                var g = ((word >> 4) & 0x7) * 36;
                var b = (word & 0x7) * 36;
                palette.Add(Color.FromArgb(255, r, g, b));
            }
        }

        while (palette.Count < 16)
        {
            var v = Math.Min(255, palette.Count * 18);
            palette.Add(Color.FromArgb(255, v, v, v));
        }

        return palette;
    }

    private static List<Bitmap> DecodeModsTiles(byte[] modsBlob, List<Color> palette)
    {
        var start = DetectModsStart(modsBlob);
        var payloadLength = modsBlob.Length - start;
        var tileCount = payloadLength / 128;
        var tiles = new List<Bitmap>(tileCount);

        for (var i = 0; i < tileCount; i++)
        {
            var tileStart = start + (i * 128);
            var bitmap = new Bitmap(16, 16, PixelFormat.Format32bppArgb);

            for (var y = 0; y < 16; y++)
            {
                var row = tileStart + (y * 8);
                var p0 = (modsBlob[row] << 8) | modsBlob[row + 1];
                var p1 = (modsBlob[row + 2] << 8) | modsBlob[row + 3];
                var p2 = (modsBlob[row + 4] << 8) | modsBlob[row + 5];
                var p3 = (modsBlob[row + 6] << 8) | modsBlob[row + 7];

                for (var x = 0; x < 16; x++)
                {
                    var shift = 15 - x;
                    var index =
                        ((p0 >> shift) & 1)
                        | (((p1 >> shift) & 1) << 1)
                        | (((p2 >> shift) & 1) << 2)
                        | (((p3 >> shift) & 1) << 3);

                    if (index == 0)
                    {
                        bitmap.SetPixel(x, y, Color.Transparent);
                    }
                    else
                    {
                        bitmap.SetPixel(x, y, palette[index]);
                    }
                }
            }

            tiles.Add(bitmap);
        }

        return tiles;
    }

    private static int DetectModsStart(byte[] blob)
    {
        if (blob.Length >= 0x80 && blob.Take(0x80).All(value => value == 0) && (blob.Length - 0x80) % 128 == 0)
        {
            return 0x80;
        }

        if (blob.Length % 128 == 0)
        {
            return 0;
        }

        return blob.Length % 128;
    }

    private static Bitmap CreatePlayerSprite(TextureField field)
    {
        const int width = 56;
        const int height = 56;
        var bitmap = new Bitmap(width, height, PixelFormat.Format32bppArgb);

        var cx = width / 2;
        for (var y = 0; y < height; y++)
        {
            for (var x = 0; x < width; x++)
            {
                var dx = Math.Abs(x - cx);
                var hullWidth = y switch
                {
                    < 10 => (10 - y) / 2,
                    < 20 => 2 + ((y - 10) / 2),
                    < 34 => 7 + ((y - 20) / 3),
                    < 48 => Math.Max(2, 12 - ((y - 34) / 2)),
                    _ => 0,
                };

                var isWing = y is >= 24 and <= 36 && dx <= 18 && dx >= 10;
                var isHull = dx <= hullWidth;
                if (!isHull && !isWing)
                {
                    bitmap.SetPixel(x, y, Color.Transparent);
                    continue;
                }

                var texture = field.Sample(x, y, seed: 11);
                var edgeBoost = Math.Clamp(1f - (dx / 18f), 0.1f, 1f);
                var t = Math.Clamp((texture / 255f) * 0.75f + (edgeBoost * 0.25f), 0f, 1f);
                var baseColor = Lerp(Color.FromArgb(10, 50, 90), Color.FromArgb(90, 240, 255), t);

                if (y > 44 && dx <= 3)
                {
                    var flame = field.Sample(x, y, seed: 77);
                    baseColor = Lerp(Color.FromArgb(255, 90, 20), Color.FromArgb(255, 230, 80), flame / 255f);
                }

                bitmap.SetPixel(x, y, Color.FromArgb(255, baseColor));
            }
        }

        using (var g = Graphics.FromImage(bitmap))
        {
            using var cockpit = new SolidBrush(Color.FromArgb(230, 200, 255, 255));
            g.FillEllipse(cockpit, cx - 5, 18, 10, 7);
        }

        return bitmap;
    }

    private static Bitmap CreateEnemySprite(TextureField field)
    {
        const int width = 48;
        const int height = 48;
        var bitmap = new Bitmap(width, height, PixelFormat.Format32bppArgb);
        var cx = width / 2f;
        var cy = height / 2f;

        for (var y = 0; y < height; y++)
        {
            for (var x = 0; x < width; x++)
            {
                var dx = (x - cx) / 19f;
                var dy = (y - cy) / 15f;
                var body = (dx * dx) + (dy * dy) <= 1.0f;
                var claw = y > 17 && Math.Abs(x - cx) > 14 && Math.Abs(x - cx) < 21;
                var horn = y < 15 && Math.Abs(x - cx) < 7 && Math.Abs(x - cx) >= (7 - y / 2f);

                if (!(body || claw || horn))
                {
                    bitmap.SetPixel(x, y, Color.Transparent);
                    continue;
                }

                var texture = field.Sample(x, y, seed: 21);
                var t = texture / 255f;
                var color = Lerp(Color.FromArgb(70, 8, 20), Color.FromArgb(255, 110, 90), t);
                bitmap.SetPixel(x, y, Color.FromArgb(255, color));
            }
        }

        using (var g = Graphics.FromImage(bitmap))
        {
            using var eyeBrush = new SolidBrush(Color.FromArgb(255, 255, 225, 120));
            g.FillEllipse(eyeBrush, 15, 18, 7, 7);
            g.FillEllipse(eyeBrush, 26, 18, 7, 7);
        }

        return bitmap;
    }

    private static Bitmap CreateBulletSprite(TextureField field)
    {
        const int width = 12;
        const int height = 24;
        var bitmap = new Bitmap(width, height, PixelFormat.Format32bppArgb);
        var cx = width / 2f;

        for (var y = 0; y < height; y++)
        {
            for (var x = 0; x < width; x++)
            {
                var dist = Math.Abs(x - cx);
                var core = dist <= (1.2f + (y / 18f));
                if (!core)
                {
                    bitmap.SetPixel(x, y, Color.Transparent);
                    continue;
                }

                var texture = field.Sample(x, y, seed: 31);
                var color = Lerp(Color.FromArgb(60, 220, 255), Color.FromArgb(240, 255, 255), texture / 255f);
                bitmap.SetPixel(x, y, Color.FromArgb(255, color));
            }
        }

        return bitmap;
    }

    private static Bitmap CreateBackgroundTile(TextureField field)
    {
        const int width = 160;
        const int height = 160;
        var bitmap = new Bitmap(width, height, PixelFormat.Format32bppArgb);

        for (var y = 0; y < height; y++)
        {
            for (var x = 0; x < width; x++)
            {
                var texture = field.Sample(x, y, seed: 41);
                var horizon = y / (float)height;
                var t = Math.Clamp((texture / 255f) * 0.55f + (horizon * 0.45f), 0f, 1f);
                var baseColor = Lerp(Color.FromArgb(3, 10, 28), Color.FromArgb(30, 90, 145), t);

                if (((x + y) % 31) == 0 || ((x * 3 + y * 5) % 97) == 0)
                {
                    var star = field.Sample(x, y, seed: 52);
                    baseColor = Lerp(baseColor, Color.FromArgb(230, 250, 255), star / 255f);
                }

                if (y % 20 == 0)
                {
                    baseColor = Lerp(baseColor, Color.FromArgb(15, 130, 170), 0.4f);
                }

                bitmap.SetPixel(x, y, Color.FromArgb(255, baseColor));
            }
        }

        return bitmap;
    }

    private static Bitmap CreateExplosionSprite(TextureField field)
    {
        const int width = 48;
        const int height = 48;
        var bitmap = new Bitmap(width, height, PixelFormat.Format32bppArgb);
        var cx = width / 2f;
        var cy = height / 2f;

        for (var y = 0; y < height; y++)
        {
            for (var x = 0; x < width; x++)
            {
                var dx = x - cx;
                var dy = y - cy;
                var dist = MathF.Sqrt((dx * dx) + (dy * dy));
                if (dist > 22f)
                {
                    bitmap.SetPixel(x, y, Color.Transparent);
                    continue;
                }

                var texture = field.Sample(x, y, seed: 63);
                var radial = Math.Clamp(1f - (dist / 22f), 0f, 1f);
                var t = Math.Clamp((texture / 255f) * 0.4f + radial * 0.6f, 0f, 1f);
                var color = Lerp(Color.FromArgb(120, 20, 0), Color.FromArgb(255, 255, 140), t);
                var alpha = (int)Math.Clamp(255f * radial, 0f, 255f);
                bitmap.SetPixel(x, y, Color.FromArgb(alpha, color));
            }
        }

        return bitmap;
    }

    private static Color Lerp(Color a, Color b, float t)
    {
        t = Math.Clamp(t, 0f, 1f);
        var r = (int)(a.R + ((b.R - a.R) * t));
        var g = (int)(a.G + ((b.G - a.G) * t));
        var bl = (int)(a.B + ((b.B - a.B) * t));
        return Color.FromArgb(r, g, bl);
    }

    private static List<Bitmap> ExtractItemIcons(IDictionary<string, Bitmap> imported)
    {
        if (!imported.Remove("items-sheet", out var sheet))
        {
            return [];
        }

        try
        {
            return SliceItemsSheet(sheet);
        }
        finally
        {
            sheet.Dispose();
        }
    }

    private static BitmapFontAtlas? ExtractHudFont(IDictionary<string, Bitmap> imported)
    {
        if (!imported.Remove("font-sheet", out var sheet))
        {
            return null;
        }

        try
        {
            return BitmapFontAtlas.TryCreateFromSmsSheet(sheet);
        }
        finally
        {
            sheet.Dispose();
        }
    }

    private static List<Bitmap> SliceItemsSheet(Bitmap source)
    {
        const int cellWidth = 16;
        const int cellHeight = 16;

        var bg = source.GetPixel(0, 0);
        var icons = new List<Bitmap>();
        var columns = (int)Math.Ceiling(source.Width / (double)cellWidth);
        var rows = (int)Math.Ceiling(source.Height / (double)cellHeight);

        for (var row = 0; row < rows; row++)
        {
            for (var col = 0; col < columns; col++)
            {
                var srcX = col * cellWidth;
                var srcY = row * cellHeight;
                if (srcX >= source.Width || srcY >= source.Height)
                {
                    continue;
                }

                var readW = Math.Min(cellWidth, source.Width - srcX);
                var readH = Math.Min(cellHeight, source.Height - srcY);
                var icon = new Bitmap(cellWidth, cellHeight, PixelFormat.Format32bppArgb);

                using (var g = Graphics.FromImage(icon))
                {
                    g.Clear(Color.Transparent);
                    g.DrawImage(source, new Rectangle(0, 0, readW, readH), new Rectangle(srcX, srcY, readW, readH), GraphicsUnit.Pixel);
                }

                RemoveColor(icon, bg);
                if (CountOpaquePixels(icon) < 40)
                {
                    icon.Dispose();
                    continue;
                }

                icons.Add(icon);
            }
        }

        return icons;
    }

    private static void RemoveColor(Bitmap bitmap, Color bg)
    {
        const int tolerance = 8;

        for (var y = 0; y < bitmap.Height; y++)
        {
            for (var x = 0; x < bitmap.Width; x++)
            {
                var pixel = bitmap.GetPixel(x, y);
                if (Math.Abs(pixel.R - bg.R) <= tolerance &&
                    Math.Abs(pixel.G - bg.G) <= tolerance &&
                    Math.Abs(pixel.B - bg.B) <= tolerance)
                {
                    bitmap.SetPixel(x, y, Color.Transparent);
                }
            }
        }
    }

    private static int CountOpaquePixels(Bitmap bitmap)
    {
        var count = 0;
        for (var y = 0; y < bitmap.Height; y++)
        {
            for (var x = 0; x < bitmap.Width; x++)
            {
                if (bitmap.GetPixel(x, y).A > 10)
                {
                    count++;
                }
            }
        }

        return count;
    }

    private static Bitmap ApplyOverride(IDictionary<string, Bitmap> imported, string key, Bitmap fallback)
    {
        if (imported.Remove(key, out var overrideBitmap))
        {
            fallback.Dispose();
            return overrideBitmap;
        }

        return fallback;
    }
}
