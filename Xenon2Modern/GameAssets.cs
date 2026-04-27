using System.Drawing.Imaging;

namespace Xenon2Modern;

public sealed class GameAssets : IDisposable
{
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

    private GameAssets(Bitmap player, Bitmap enemy, Bitmap bullet, Bitmap backgroundTile, Bitmap explosion)
    {
        Player = player;
        Enemy = enemy;
        Bullet = bullet;
        BackgroundTile = backgroundTile;
        Explosion = explosion;
    }

    public Bitmap Player { get; }

    public Bitmap Enemy { get; }

    public Bitmap Bullet { get; }

    public Bitmap BackgroundTile { get; }

    public Bitmap Explosion { get; }

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
                explosion: explosion
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
