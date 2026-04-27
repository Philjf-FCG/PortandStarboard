using System.Diagnostics;

namespace Xenon2Modern;

public sealed class GameForm : Form
{
    private readonly HashSet<Keys> _keysDown = [];
    private readonly Stopwatch _frameClock = Stopwatch.StartNew();
    private readonly System.Windows.Forms.Timer _gameTimer;

    private GameAssets _assets;
    private GameWorld _world;

    public GameForm()
    {
        Text = "Xenon2 Modern - Gameplay Port";
        ClientSize = new Size(960, 720);
        BackColor = Color.Black;
        KeyPreview = true;
        MinimumSize = new Size(720, 540);

        SetStyle(ControlStyles.AllPaintingInWmPaint | ControlStyles.UserPaint | ControlStyles.OptimizedDoubleBuffer, true);
        DoubleBuffered = true;

        var assetRoot = Path.Combine(AppContext.BaseDirectory, "assets");
        _assets = GameAssets.LoadFromLegacyFiles(assetRoot);
        _world = new GameWorld(_assets, ClientSize);

        _gameTimer = new System.Windows.Forms.Timer { Interval = 16 };
        _gameTimer.Tick += (_, _) => OnFrame();
        _gameTimer.Start();

        KeyDown += OnGameKeyDown;
        KeyUp += OnGameKeyUp;
        Resize += (_, _) => KeepPlayerInBounds();
    }

    protected override void OnPaint(PaintEventArgs e)
    {
        base.OnPaint(e);
        _world.Render(e.Graphics, ClientRectangle);
    }

    protected override void OnFormClosed(FormClosedEventArgs e)
    {
        _gameTimer.Stop();
        _assets.Dispose();
        base.OnFormClosed(e);
    }

    private void OnFrame()
    {
        var dt = (float)_frameClock.Elapsed.TotalSeconds;
        _frameClock.Restart();

        dt = Math.Clamp(dt, 0.001f, 0.05f);
        _world.Update(dt, BuildInput(), ClientSize);
        Invalidate();
    }

    private FrameInput BuildInput()
    {
        return new FrameInput(
            Left: IsDown(Keys.Left, Keys.A),
            Right: IsDown(Keys.Right, Keys.D),
            Up: IsDown(Keys.Up, Keys.W),
            Down: IsDown(Keys.Down, Keys.S),
            Fire: IsDown(Keys.Space, Keys.ControlKey),
            Confirm: IsDown(Keys.Enter));
    }

    private bool IsDown(params Keys[] keys)
    {
        return keys.Any(_keysDown.Contains);
    }

    private void OnGameKeyDown(object? sender, KeyEventArgs e)
    {
        _keysDown.Add(e.KeyCode);
    }

    private void OnGameKeyUp(object? sender, KeyEventArgs e)
    {
        _keysDown.Remove(e.KeyCode);
    }

    private void KeepPlayerInBounds()
    {
        // Re-anchor world entities to the latest client size after window resize.
        if (ClientSize.Width > 0 && ClientSize.Height > 0)
        {
            _world.Update(0.001f, BuildInput(), ClientSize);
        }
    }
}
