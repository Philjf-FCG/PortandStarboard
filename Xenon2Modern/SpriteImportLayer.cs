using System.Drawing.Imaging;
using System.Text.Json;

namespace Xenon2Modern;

public static class SpriteImportLayer
{
    private static readonly (string Key, string[] RegionAliases, string[] FileNames)[] AssetSpecs =
    [
        ("player", ["player", "ship"], ["player.png", "ship.png"]),
        ("enemy", ["enemy", "foe"], ["enemy.png", "foe.png"]),
        ("bullet", ["bullet", "projectile"], ["bullet.png", "projectile.png"]),
        ("background", ["background", "backgroundTile", "tile"], ["background.png", "background_tile.png", "tile.png"]),
        ("explosion", ["explosion", "blast"], ["explosion.png", "blast.png"]),
    ];

    public static Dictionary<string, Bitmap> LoadOverrides(string assetRoot)
    {
        var result = new Dictionary<string, Bitmap>(StringComparer.OrdinalIgnoreCase);

        foreach (var root in DiscoverRoots(assetRoot))
        {
            LoadFromManifest(root, result);
            LoadFromDirectFiles(root, result);

            if (result.Count >= AssetSpecs.Length)
            {
                break;
            }
        }

        return result;
    }

    private static IEnumerable<string> DiscoverRoots(string assetRoot)
    {
        var roots = new HashSet<string>(StringComparer.OrdinalIgnoreCase);

        var envPath = Environment.GetEnvironmentVariable("XENON2_SPRITES_PATH");
        if (!string.IsNullOrWhiteSpace(envPath) && Directory.Exists(envPath))
        {
            roots.Add(Path.GetFullPath(envPath));
        }

        AddIfDirectory(Path.Combine(AppContext.BaseDirectory, "user-sprites"));
        AddIfDirectory(Path.Combine(assetRoot, "user-sprites"));
        AddIfDirectory(Path.Combine(assetRoot, "imports"));

        // Supports Visual Studio dev runs from bin/x64/... back to workspace root.
        AddIfDirectory(Path.GetFullPath(Path.Combine(AppContext.BaseDirectory, "..", "..", "..", "..", "user-sprites")));

        foreach (var root in roots)
        {
            yield return root;
        }

        void AddIfDirectory(string path)
        {
            if (Directory.Exists(path))
            {
                roots.Add(Path.GetFullPath(path));
            }
        }
    }

    private static void LoadFromDirectFiles(string root, IDictionary<string, Bitmap> result)
    {
        foreach (var (key, _, files) in AssetSpecs)
        {
            if (result.ContainsKey(key))
            {
                continue;
            }

            foreach (var fileName in files)
            {
                var fullPath = Path.Combine(root, fileName);
                if (!File.Exists(fullPath))
                {
                    continue;
                }

                var loaded = TryLoadBitmap(fullPath);
                if (loaded is null)
                {
                    continue;
                }

                result[key] = loaded;
                break;
            }
        }
    }

    private static void LoadFromManifest(string root, IDictionary<string, Bitmap> result)
    {
        var manifestPath = Path.Combine(root, "sprite-manifest.json");
        if (!File.Exists(manifestPath))
        {
            return;
        }

        try
        {
            using var stream = File.OpenRead(manifestPath);
            using var doc = JsonDocument.Parse(stream);

            if (!TryGetPropertyIgnoreCase(doc.RootElement, "sheet", out var sheetElement) ||
                sheetElement.ValueKind != JsonValueKind.String)
            {
                return;
            }

            var sheetName = sheetElement.GetString();
            if (string.IsNullOrWhiteSpace(sheetName))
            {
                return;
            }

            var sheetPath = Path.Combine(root, sheetName);
            var sheet = TryLoadBitmap(sheetPath);
            if (sheet is null)
            {
                return;
            }

            try
            {
                if (!TryGetPropertyIgnoreCase(doc.RootElement, "regions", out var regions) ||
                    regions.ValueKind != JsonValueKind.Object)
                {
                    return;
                }

                foreach (var (key, aliases, _) in AssetSpecs)
                {
                    if (result.ContainsKey(key))
                    {
                        continue;
                    }

                    foreach (var alias in aliases)
                    {
                        if (!TryGetPropertyIgnoreCase(regions, alias, out var region) || region.ValueKind != JsonValueKind.Object)
                        {
                            continue;
                        }

                        if (!TryReadRegion(region, out var x, out var y, out var w, out var h))
                        {
                            continue;
                        }

                        if (x < 0 || y < 0 || w <= 0 || h <= 0)
                        {
                            continue;
                        }

                        if (x + w > sheet.Width || y + h > sheet.Height)
                        {
                            continue;
                        }

                        var clone = sheet.Clone(new Rectangle(x, y, w, h), PixelFormat.Format32bppArgb);
                        result[key] = clone;
                        break;
                    }
                }
            }
            finally
            {
                sheet.Dispose();
            }
        }
        catch
        {
            // Ignore malformed sprite manifests and continue with generated art.
        }
    }

    private static Bitmap? TryLoadBitmap(string fullPath)
    {
        try
        {
            using var stream = File.OpenRead(fullPath);
            using var image = Image.FromStream(stream, useEmbeddedColorManagement: false, validateImageData: false);
            var bitmap = new Bitmap(image.Width, image.Height, PixelFormat.Format32bppArgb);

            using var graphics = Graphics.FromImage(bitmap);
            graphics.DrawImage(image, 0, 0, image.Width, image.Height);
            return bitmap;
        }
        catch
        {
            return null;
        }
    }

    private static bool TryReadRegion(JsonElement region, out int x, out int y, out int w, out int h)
    {
        x = 0;
        y = 0;
        w = 0;
        h = 0;

        return TryReadInt(region, "x", out x) &&
               TryReadInt(region, "y", out y) &&
               TryReadInt(region, "w", out w) &&
               TryReadInt(region, "h", out h);
    }

    private static bool TryReadInt(JsonElement obj, string name, out int value)
    {
        value = 0;
        if (!TryGetPropertyIgnoreCase(obj, name, out var elem))
        {
            return false;
        }

        return elem.ValueKind switch
        {
            JsonValueKind.Number => elem.TryGetInt32(out value),
            JsonValueKind.String => int.TryParse(elem.GetString(), out value),
            _ => false,
        };
    }

    private static bool TryGetPropertyIgnoreCase(JsonElement obj, string name, out JsonElement value)
    {
        if (obj.ValueKind == JsonValueKind.Object)
        {
            foreach (var prop in obj.EnumerateObject())
            {
                if (string.Equals(prop.Name, name, StringComparison.OrdinalIgnoreCase))
                {
                    value = prop.Value;
                    return true;
                }
            }
        }

        value = default;
        return false;
    }
}
