namespace Xenon2Modern;

public sealed class GameWorld
{
    private sealed class Bullet
    {
        public PointF Position;
        public float Speed;
        public SizeF Size;
    }

    private sealed class Enemy
    {
        public PointF Position;
        public PointF Velocity;
        public SizeF Size;
        public float SinePhase;
        public int Health;
    }

    private sealed class Explosion
    {
        public PointF Position;
        public float Remaining;
        public float Duration;
        public SizeF Size;
    }

    private readonly List<Bullet> _bullets = [];
    private readonly List<Enemy> _enemies = [];
    private readonly List<Explosion> _explosions = [];
    private readonly Random _random = new(68000);
    private readonly GameAssets _assets;

    private RectangleF _playerBounds;
    private float _fireCooldown;
    private float _enemySpawnTimer;
    private float _stageTimer;
    private float _backgroundOffset;

    public GameWorld(GameAssets assets, Size initialViewport)
    {
        _assets = assets;
        Reset(initialViewport);
    }

    public int Score { get; private set; }

    public int Lives { get; private set; }

    public int Stage { get; private set; }

    public bool IsGameOver { get; private set; }

    public void Reset(Size viewport)
    {
        _bullets.Clear();
        _enemies.Clear();
        _explosions.Clear();

        Score = 0;
        Lives = 3;
        Stage = 1;
        IsGameOver = false;

        _fireCooldown = 0f;
        _enemySpawnTimer = 0.8f;
        _stageTimer = 0f;
        _backgroundOffset = 0f;

        var x = (viewport.Width - _assets.Player.Width) / 2f;
        var y = viewport.Height - _assets.Player.Height - 28f;
        _playerBounds = new RectangleF(x, y, _assets.Player.Width, _assets.Player.Height);
    }

    public void Update(float deltaSeconds, FrameInput input, Size viewport)
    {
        if (deltaSeconds <= 0f)
        {
            return;
        }

        if (IsGameOver)
        {
            if (input.Confirm)
            {
                Reset(viewport);
            }
            return;
        }

        _stageTimer += deltaSeconds;
        if (_stageTimer >= 25f)
        {
            _stageTimer = 0f;
            Stage++;
        }

        _backgroundOffset += deltaSeconds * (100f + (Stage * 10f));

        UpdatePlayer(deltaSeconds, input, viewport);
        UpdateBullets(deltaSeconds);
        UpdateEnemies(deltaSeconds, viewport);
        UpdateExplosions(deltaSeconds);
        ResolveCollisions();
        SpawnEnemies(deltaSeconds, viewport);
    }

    public void Render(Graphics g, Rectangle clientRect)
    {
        DrawBackground(g, clientRect);

        foreach (var bullet in _bullets)
        {
            g.DrawImage(_assets.Bullet, bullet.Position.X, bullet.Position.Y, bullet.Size.Width, bullet.Size.Height);
        }

        foreach (var enemy in _enemies)
        {
            g.DrawImage(_assets.Enemy, enemy.Position.X, enemy.Position.Y, enemy.Size.Width, enemy.Size.Height);
        }

        foreach (var explosion in _explosions)
        {
            var progress = 1f - (explosion.Remaining / explosion.Duration);
            var scale = 0.6f + (0.8f * progress);
            var width = explosion.Size.Width * scale;
            var height = explosion.Size.Height * scale;
            var x = explosion.Position.X - (width / 2f);
            var y = explosion.Position.Y - (height / 2f);
            g.DrawImage(_assets.Explosion, x, y, width, height);
        }

        g.DrawImage(_assets.Player, _playerBounds.X, _playerBounds.Y, _playerBounds.Width, _playerBounds.Height);

        using var hudBrush = new SolidBrush(Color.FromArgb(230, 220, 255, 240));
        using var hudFont = new Font("Consolas", 12f, FontStyle.Bold);
        var hudText = $"SCORE {Score:000000}   LIVES {Lives}   STAGE {Stage}";
        g.DrawString(hudText, hudFont, hudBrush, 14f, 12f);

        if (IsGameOver)
        {
            using var overlay = new SolidBrush(Color.FromArgb(180, 0, 0, 0));
            g.FillRectangle(overlay, clientRect);
            using var titleBrush = new SolidBrush(Color.FromArgb(255, 255, 210, 180));
            using var subBrush = new SolidBrush(Color.FromArgb(255, 230, 230, 230));
            using var titleFont = new Font("Consolas", 24f, FontStyle.Bold);
            using var subFont = new Font("Consolas", 12f, FontStyle.Regular);
            var title = "GAME OVER";
            var sub = "Press Enter to restart";
            var titleSize = g.MeasureString(title, titleFont);
            var subSize = g.MeasureString(sub, subFont);
            g.DrawString(title, titleFont, titleBrush, (clientRect.Width - titleSize.Width) / 2f, clientRect.Height * 0.42f);
            g.DrawString(sub, subFont, subBrush, (clientRect.Width - subSize.Width) / 2f, clientRect.Height * 0.52f);
        }
    }

    private void UpdatePlayer(float deltaSeconds, FrameInput input, Size viewport)
    {
        const float speed = 320f;
        var dx = 0f;
        var dy = 0f;

        if (input.Left)
        {
            dx -= speed;
        }
        if (input.Right)
        {
            dx += speed;
        }
        if (input.Up)
        {
            dy -= speed;
        }
        if (input.Down)
        {
            dy += speed;
        }

        _playerBounds.X += dx * deltaSeconds;
        _playerBounds.Y += dy * deltaSeconds;

        _playerBounds.X = Math.Clamp(_playerBounds.X, 0f, viewport.Width - _playerBounds.Width);
        _playerBounds.Y = Math.Clamp(_playerBounds.Y, 0f, viewport.Height - _playerBounds.Height);

        _fireCooldown -= deltaSeconds;
        if (input.Fire && _fireCooldown <= 0f)
        {
            _fireCooldown = 0.14f;
            _bullets.Add(new Bullet
            {
                Position = new PointF(_playerBounds.X + (_playerBounds.Width / 2f) - 3f, _playerBounds.Y - 12f),
                Size = new SizeF(8f, 20f),
                Speed = 540f,
            });
        }
    }

    private void UpdateBullets(float deltaSeconds)
    {
        for (var i = _bullets.Count - 1; i >= 0; i--)
        {
            var bullet = _bullets[i];
            bullet.Position = new PointF(bullet.Position.X, bullet.Position.Y - (bullet.Speed * deltaSeconds));
            if (bullet.Position.Y + bullet.Size.Height < -4f)
            {
                _bullets.RemoveAt(i);
            }
        }
    }

    private void UpdateEnemies(float deltaSeconds, Size viewport)
    {
        for (var i = _enemies.Count - 1; i >= 0; i--)
        {
            var enemy = _enemies[i];
            enemy.SinePhase += deltaSeconds * 2.2f;
            var drift = MathF.Sin(enemy.SinePhase) * 75f;
            enemy.Position = new PointF(
                enemy.Position.X + ((enemy.Velocity.X + drift) * deltaSeconds),
                enemy.Position.Y + (enemy.Velocity.Y * deltaSeconds));

            if (enemy.Position.Y > viewport.Height + 20f)
            {
                _enemies.RemoveAt(i);
            }
            else
            {
                enemy.Position = new PointF(Math.Clamp(enemy.Position.X, 0f, viewport.Width - enemy.Size.Width), enemy.Position.Y);
            }
        }
    }

    private void UpdateExplosions(float deltaSeconds)
    {
        for (var i = _explosions.Count - 1; i >= 0; i--)
        {
            var explosion = _explosions[i];
            explosion.Remaining -= deltaSeconds;
            if (explosion.Remaining <= 0f)
            {
                _explosions.RemoveAt(i);
            }
        }
    }

    private void ResolveCollisions()
    {
        var playerRect = _playerBounds;

        for (var b = _bullets.Count - 1; b >= 0; b--)
        {
            var bullet = _bullets[b];
            var bulletRect = new RectangleF(bullet.Position, bullet.Size);
            var bulletConsumed = false;

            for (var e = _enemies.Count - 1; e >= 0; e--)
            {
                var enemy = _enemies[e];
                var enemyRect = new RectangleF(enemy.Position, enemy.Size);
                if (!bulletRect.IntersectsWith(enemyRect))
                {
                    continue;
                }

                bulletConsumed = true;
                enemy.Health--;
                if (enemy.Health <= 0)
                {
                    Score += 100 + (Stage * 10);
                    _explosions.Add(new Explosion
                    {
                        Position = new PointF(enemy.Position.X + (enemy.Size.Width / 2f), enemy.Position.Y + (enemy.Size.Height / 2f)),
                        Size = new SizeF(46f, 46f),
                        Duration = 0.35f,
                        Remaining = 0.35f,
                    });
                    _enemies.RemoveAt(e);
                }
                break;
            }

            if (bulletConsumed)
            {
                _bullets.RemoveAt(b);
            }
        }

        for (var e = _enemies.Count - 1; e >= 0; e--)
        {
            var enemyRect = new RectangleF(_enemies[e].Position, _enemies[e].Size);
            if (!playerRect.IntersectsWith(enemyRect))
            {
                continue;
            }

            _enemies.RemoveAt(e);
            LoseLife();
            break;
        }
    }

    private void SpawnEnemies(float deltaSeconds, Size viewport)
    {
        _enemySpawnTimer -= deltaSeconds;
        if (_enemySpawnTimer > 0f)
        {
            return;
        }

        var baseSpawn = 0.95f - (Stage * 0.08f);
        _enemySpawnTimer = Math.Clamp(baseSpawn, 0.2f, 0.95f);

        var width = 34f + _random.Next(0, 10);
        var height = width;
        var x = _random.NextSingle() * Math.Max(10f, viewport.Width - width - 2f);
        var speedY = 80f + (_random.NextSingle() * 70f) + (Stage * 14f);

        _enemies.Add(new Enemy
        {
            Position = new PointF(x, -height - 8f),
            Velocity = new PointF((_random.NextSingle() - 0.5f) * 30f, speedY),
            SinePhase = _random.NextSingle() * MathF.PI,
            Size = new SizeF(width, height),
            Health = 1 + (Stage / 5),
        });
    }

    private void LoseLife()
    {
        Lives--;
        _explosions.Add(new Explosion
        {
            Position = new PointF(_playerBounds.X + (_playerBounds.Width / 2f), _playerBounds.Y + (_playerBounds.Height / 2f)),
            Size = new SizeF(64f, 64f),
            Duration = 0.5f,
            Remaining = 0.5f,
        });

        if (Lives <= 0)
        {
            IsGameOver = true;
        }
    }

    private void DrawBackground(Graphics g, Rectangle clientRect)
    {
        using var bgBrush = new SolidBrush(Color.FromArgb(255, 2, 5, 16));
        g.FillRectangle(bgBrush, clientRect);

        var tile = _assets.BackgroundTile;
        var tileW = Math.Max(32, tile.Width);
        var tileH = Math.Max(32, tile.Height);

        var yStart = -(_backgroundOffset % tileH);
        for (var y = yStart; y < clientRect.Height; y += tileH)
        {
            for (var x = 0; x < clientRect.Width; x += tileW)
            {
                g.DrawImage(tile, x, y, tileW, tileH);
            }
        }
    }
}
