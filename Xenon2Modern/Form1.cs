namespace Xenon2Modern;

public partial class Form1 : Form
{
    private LegacyAssetCatalog? _catalog;
    private readonly ListBox _assetList = new();
    private readonly TextBox _details = new();
    private readonly PictureBox _preview = new();

    public Form1()
    {
        InitializeComponent();
        ConfigureUi();
        LoadAssets();
    }

    private void ConfigureUi()
    {
        Text = "Xenon2 Modern Rebuild - Legacy Asset Explorer";
        MinimumSize = new Size(1100, 700);

        _assetList.Dock = DockStyle.Left;
        _assetList.Width = 360;
        _assetList.Font = new Font("Consolas", 9.5F, FontStyle.Regular);
        _assetList.SelectedIndexChanged += AssetListOnSelectedIndexChanged;

        _details.Dock = DockStyle.Top;
        _details.Height = 170;
        _details.Multiline = true;
        _details.ReadOnly = true;
        _details.ScrollBars = ScrollBars.Vertical;
        _details.Font = new Font("Consolas", 10F, FontStyle.Regular);

        _preview.Dock = DockStyle.Fill;
        _preview.SizeMode = PictureBoxSizeMode.Zoom;
        _preview.BackColor = Color.Black;

        var rightPanel = new Panel
        {
            Dock = DockStyle.Fill,
            Padding = new Padding(8),
        };

        rightPanel.Controls.Add(_preview);
        rightPanel.Controls.Add(_details);

        Controls.Add(rightPanel);
        Controls.Add(_assetList);
    }

    private void LoadAssets()
    {
        var assetRoot = Path.Combine(AppContext.BaseDirectory, "assets");
        _catalog = LegacyAssetCatalog.Load(assetRoot);

        _assetList.Items.Clear();
        foreach (var file in _catalog.Files)
        {
            _assetList.Items.Add(file.RelativePath.Replace('\\', '/'));
        }

        _details.Text = _catalog.Files.Count == 0
            ? "No legacy assets were found.\r\nBuild once so the assets are copied into output/assets."
            : $"Asset root: {assetRoot}\r\nFiles discovered: {_catalog.Files.Count}\r\n\r\nSelect a file to inspect metadata and preview bytes.";
    }

    private void AssetListOnSelectedIndexChanged(object? sender, EventArgs e)
    {
        if (_catalog is null || _assetList.SelectedIndex < 0)
        {
            return;
        }

        var file = _catalog.Files[_assetList.SelectedIndex];
        var bytes = _catalog.ReadBytes(file);
        var firstBytes = string.Join(" ", bytes.Take(32).Select(value => value.ToString("X2")));

        _details.Text =
            $"File: {file.RelativePath.Replace('\\', '/')}\r\n" +
            $"Size: {file.Size:N0} bytes\r\n" +
            $"Extension: {file.Extension}\r\n" +
            $"\r\n" +
            $"First 32 bytes:\r\n{firstBytes}";

        _preview.Image?.Dispose();
        _preview.Image = ShouldGeneratePreview(file.Extension)
            ? LegacyAssetDecoder.DecodeIndexedBytesAsGrayscale(bytes, width: 256)
            : null;
    }

    private static bool ShouldGeneratePreview(string extension)
    {
        return extension is ".VGA" or ".CMP" or ".DAT";
    }
}
