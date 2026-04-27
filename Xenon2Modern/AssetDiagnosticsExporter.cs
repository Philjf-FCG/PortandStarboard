using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Security.Cryptography;
using System.Text.Json;

namespace Xenon2Modern;

internal static class AssetDiagnosticsExporter
{
    public static bool TryRun(string[] args, out int exitCode)
    {
        exitCode = 0;
        if (!TryGetOptionValue(args, "--export-assets", out _))
        {
            return false;
        }

        exitCode = RunExport(args);
        return true;
    }

    private static int RunExport(string[] args)
    {
        if (!TryGetOptionValue(args, "--export-assets", out var outputRoot) || string.IsNullOrWhiteSpace(outputRoot))
        {
            return 2;
        }

        var assetRoot = Path.Combine(AppContext.BaseDirectory, "assets");
        if (TryGetOptionValue(args, "--asset-root", out var assetRootOption) && !string.IsNullOrWhiteSpace(assetRootOption))
        {
            assetRoot = assetRootOption;
        }

        var sourceOrder = "xenon2-first";
        if (TryGetOptionValue(args, "--amiga-source-order", out var sourceOrderOption) && !string.IsNullOrWhiteSpace(sourceOrderOption))
        {
            sourceOrder = sourceOrderOption.Trim().ToLowerInvariant();
        }

        if (sourceOrder != "xenon2-first" && sourceOrder != "dj99-first")
        {
            return 3;
        }

        var preferGameExecutable = sourceOrder == "xenon2-first";
        var outputDir = Path.GetFullPath(outputRoot);
        var spritesDir = Path.Combine(outputDir, "sprites");
        var mapsDir = Path.Combine(outputDir, "maps");

        Directory.CreateDirectory(outputDir);
        Directory.CreateDirectory(spritesDir);
        Directory.CreateDirectory(mapsDir);

        using var assets = GameAssets.LoadFromLegacyFiles(assetRoot, preferGameExecutable);

        var artifacts = new List<ArtifactDigest>();

        SaveBitmap(Path.Combine(spritesDir, "player.png"), assets.Player, artifacts, outputDir);
        SaveBitmap(Path.Combine(spritesDir, "enemy.png"), assets.Enemy, artifacts, outputDir);
        SaveBitmap(Path.Combine(spritesDir, "bullet.png"), assets.Bullet, artifacts, outputDir);
        SaveBitmap(Path.Combine(spritesDir, "background.png"), assets.BackgroundTile, artifacts, outputDir);
        SaveBitmap(Path.Combine(spritesDir, "explosion.png"), assets.Explosion, artifacts, outputDir);

        for (var i = 0; i < assets.ItemIcons.Count; i++)
        {
            SaveBitmap(Path.Combine(spritesDir, $"item_{i:D2}.png"), assets.ItemIcons[i], artifacts, outputDir);
        }

        var mapSummaries = new List<MapSummary>();
        foreach (var stage in assets.StageBackgroundMaps.Keys.OrderBy(stage => stage))
        {
            var map = assets.StageBackgroundMaps[stage];
            var previewPath = Path.Combine(mapsDir, $"stage{stage:D1}_map_preview.png");
            SaveMapPreview(previewPath, map, artifacts, outputDir);

            var minTile = 255;
            var maxTile = 0;
            var sample = new List<string>();
            for (var i = 0; i < map.Cells.Count; i++)
            {
                var entry = map.Cells[i];
                var tile = entry & 0xFF;
                minTile = Math.Min(minTile, tile);
                maxTile = Math.Max(maxTile, tile);
                if (sample.Count < 24)
                {
                    sample.Add($"0x{entry:X4}");
                }
            }

            mapSummaries.Add(new MapSummary(
                Stage: stage,
                Width: map.Width,
                Height: map.Height,
                CellCount: map.Cells.Count,
                Decoder: map.Decoder,
                MinTile: minTile,
                MaxTile: maxTile,
                SampleEntries: sample));
        }

        var summary = new ExportSummary(
            GeneratedAtUtc: DateTime.UtcNow,
            AssetRoot: Path.GetFullPath(assetRoot),
            OutputRoot: outputDir,
            AmigaSourceOrder: sourceOrder,
            ArtifactDigests: artifacts.OrderBy(a => a.RelativePath).ToArray(),
            StageMaps: mapSummaries.ToArray());

        var summaryPath = Path.Combine(outputDir, "summary.json");
        var json = JsonSerializer.Serialize(summary, new JsonSerializerOptions
        {
            WriteIndented = true,
        });
        File.WriteAllText(summaryPath, json);

        Console.WriteLine($"Exported diagnostics to: {outputDir}");
        Console.WriteLine($"Summary: {summaryPath}");

        return 0;
    }

    private static void SaveBitmap(string path, Bitmap source, ICollection<ArtifactDigest> artifacts, string outputRoot)
    {
        source.Save(path, ImageFormat.Png);
        AddDigest(path, artifacts, outputRoot);
    }

    private static void SaveMapPreview(string path, GameAssets.StageBackgroundMap map, ICollection<ArtifactDigest> artifacts, string outputRoot)
    {
        if (map.Width <= 0 || map.Height <= 0 || map.Cells.Count == 0)
        {
            using var empty = new Bitmap(1, 1, PixelFormat.Format32bppArgb);
            empty.SetPixel(0, 0, Color.Transparent);
            empty.Save(path, ImageFormat.Png);
            AddDigest(path, artifacts, outputRoot);
            return;
        }

        using var tiny = new Bitmap(map.Width, map.Height, PixelFormat.Format32bppArgb);
        for (var y = 0; y < map.Height; y++)
        {
            for (var x = 0; x < map.Width; x++)
            {
                var index = (y * map.Width) + x;
                if (index >= map.Cells.Count)
                {
                    tiny.SetPixel(x, y, Color.Black);
                    continue;
                }

                var entry = map.Cells[index];
                var attr = (entry >> 8) & 0xFF;
                var tile = entry & 0xFF;
                tiny.SetPixel(x, y, Color.FromArgb(255, tile, (tile + attr) / 2, attr));
            }
        }

        const int scale = 8;
        using var scaled = new Bitmap(Math.Max(1, map.Width * scale), Math.Max(1, map.Height * scale), PixelFormat.Format32bppArgb);
        using (var g = Graphics.FromImage(scaled))
        {
            g.InterpolationMode = InterpolationMode.NearestNeighbor;
            g.PixelOffsetMode = PixelOffsetMode.Half;
            g.CompositingQuality = CompositingQuality.HighSpeed;
            g.DrawImage(tiny, new Rectangle(0, 0, scaled.Width, scaled.Height));
        }

        scaled.Save(path, ImageFormat.Png);
        AddDigest(path, artifacts, outputRoot);
    }

    private static void AddDigest(string path, ICollection<ArtifactDigest> artifacts, string outputRoot)
    {
        var bytes = File.ReadAllBytes(path);
        var hash = SHA256.HashData(bytes);
        var hex = Convert.ToHexString(hash).ToLowerInvariant();
        var relativePath = Path.GetRelativePath(outputRoot, path).Replace('\\', '/');
        artifacts.Add(new ArtifactDigest(RelativePath: relativePath, Sha256: hex, SizeBytes: bytes.Length));
    }

    private static bool TryGetOptionValue(string[] args, string option, out string value)
    {
        value = string.Empty;
        if (args.Length == 0)
        {
            return false;
        }

        for (var i = 0; i < args.Length; i++)
        {
            var arg = args[i];
            if (string.Equals(arg, option, StringComparison.OrdinalIgnoreCase))
            {
                if (i + 1 >= args.Length)
                {
                    return false;
                }

                value = args[i + 1];
                return true;
            }

            if (arg.StartsWith(option + "=", StringComparison.OrdinalIgnoreCase))
            {
                value = arg[(option.Length + 1)..];
                return true;
            }
        }

        return false;
    }

    private sealed record ArtifactDigest(string RelativePath, string Sha256, int SizeBytes);

    private sealed record MapSummary(
        int Stage,
        int Width,
        int Height,
        int CellCount,
        string Decoder,
        int MinTile,
        int MaxTile,
        IReadOnlyList<string> SampleEntries);

    private sealed record ExportSummary(
        DateTime GeneratedAtUtc,
        string AssetRoot,
        string OutputRoot,
        string AmigaSourceOrder,
        IReadOnlyList<ArtifactDigest> ArtifactDigests,
        IReadOnlyList<MapSummary> StageMaps);
}
