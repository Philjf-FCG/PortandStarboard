namespace Xenon2Modern;

public sealed record LegacyAssetFile(string RelativePath, long Size, string Extension);

public sealed class LegacyAssetCatalog
{
    private LegacyAssetCatalog(string rootPath, IReadOnlyList<LegacyAssetFile> files)
    {
        RootPath = rootPath;
        Files = files;
    }

    public string RootPath { get; }

    public IReadOnlyList<LegacyAssetFile> Files { get; }

    public static LegacyAssetCatalog Load(string rootPath)
    {
        if (!Directory.Exists(rootPath))
        {
            return new LegacyAssetCatalog(rootPath, []);
        }

        var files = Directory
            .EnumerateFiles(rootPath, "*", SearchOption.AllDirectories)
            .Select(path => new FileInfo(path))
            .Select(info => new LegacyAssetFile(
                RelativePath: Path.GetRelativePath(rootPath, info.FullName),
                Size: info.Length,
                Extension: info.Extension.ToUpperInvariant()))
            .OrderBy(file => file.RelativePath, StringComparer.OrdinalIgnoreCase)
            .ToArray();

        return new LegacyAssetCatalog(rootPath, files);
    }

    public byte[] ReadBytes(LegacyAssetFile file)
    {
        var fullPath = Path.Combine(RootPath, file.RelativePath);
        return File.ReadAllBytes(fullPath);
    }
}
