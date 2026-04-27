using System.Drawing.Drawing2D;

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
    private readonly List<(Bitmap Icon, RectangleF Bounds)> _hudItemIcons = [];
    private readonly Dictionary<int, IReadOnlyList<Bitmap>> _renderableBackgroundTilesByStage = [];
    private readonly Random _random = new(68000);
    private readonly GameAssets _assets;
    private bool _debugOverlayEnabled = true;

    private RectangleF _playerBounds;
    private float _fireCooldown;
    private float _enemySpawnTimer;
    private float _stageTimer;
    private float _backgroundOffset;
    private float _lastDeltaSeconds;

    public GameWorld(GameAssets assets, Size initialViewport)
    {
        _assets = assets;
        Reset(initialViewport);
    }

    public int Score { get; private set; }

    public int Lives { get; private set; }

    public int Stage { get; private set; }

    public bool IsGameOver { get; private set; }

    public bool DebugOverlayEnabled => _debugOverlayEnabled;

    public void ToggleDebugOverlay()
    {
        _debugOverlayEnabled = !_debugOverlayEnabled;
    }

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
        _hudItemIcons.Clear();

        if (_assets.ItemIcons.Count > 0)
        {
            for (var i = 0; i < Math.Min(5, _assets.ItemIcons.Count); i++)
            {
                _hudItemIcons.Add((_assets.ItemIcons[i], RectangleF.Empty));
            }
        }

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

        _lastDeltaSeconds = deltaSeconds;

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

        var hudText = $"SCORE {Score:000000}   LIVES {Lives}   STAGE {Stage}";
        DrawHudText(g, hudText, 14f, 12f);

        var hudIconX = clientRect.Width - 24f;
        for (var i = 0; i < Lives; i++)
        {
            if (_assets.ItemIcons.Count == 0)
            {
                break;
            }

            var icon = _assets.ItemIcons[(i + 1) % _assets.ItemIcons.Count];
            var x = hudIconX - (i * 18f);
            g.DrawImage(icon, x, 10f, 16f, 16f);
        }

        var itemHudX = 14f;
        var itemHudY = 38f;
        for (var i = 0; i < _hudItemIcons.Count; i++)
        {
            var icon = _hudItemIcons[i].Icon;
            var rect = new RectangleF(itemHudX + (i * 18f), itemHudY, 16f, 16f);
            _hudItemIcons[i] = (icon, rect);
            g.DrawImage(icon, rect);
        }

        if (IsGameOver)
        {
            using var overlay = new SolidBrush(Color.FromArgb(180, 0, 0, 0));
            g.FillRectangle(overlay, clientRect);
            var title = "GAME OVER";
            var sub = "PRESS ENTER TO RESTART";

            if (_assets.HudFont is not null)
            {
                var titleSize = _assets.HudFont.Measure(title, scale: 3f, tracking: 2f);
                var subSize = _assets.HudFont.Measure(sub, scale: 1.4f, tracking: 1f);
                _assets.HudFont.DrawString(g, title, (clientRect.Width - titleSize.Width) / 2f, clientRect.Height * 0.42f, scale: 3f, tracking: 2f);
                _assets.HudFont.DrawString(g, sub, (clientRect.Width - subSize.Width) / 2f, clientRect.Height * 0.52f, scale: 1.4f, tracking: 1f);
            }
            else
            {
                using var titleBrush = new SolidBrush(Color.FromArgb(255, 255, 210, 180));
                using var subBrush = new SolidBrush(Color.FromArgb(255, 230, 230, 230));
                using var titleFont = new Font("Consolas", 24f, FontStyle.Bold);
                using var subFont = new Font("Consolas", 12f, FontStyle.Regular);
                var titleSize = g.MeasureString(title, titleFont);
                var subSize = g.MeasureString(sub, subFont);
                g.DrawString(title, titleFont, titleBrush, (clientRect.Width - titleSize.Width) / 2f, clientRect.Height * 0.42f);
                g.DrawString(sub, subFont, subBrush, (clientRect.Width - subSize.Width) / 2f, clientRect.Height * 0.52f);
            }
        }

        DrawDebugOverlay(g, clientRect);
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

        var stage = ((Math.Max(1, Stage) - 1) % 5) + 1;
        var tiles = GetRenderableBackgroundTiles(stage);
        if (tiles.Count == 0)
        {
            var tile = _assets.BackgroundTile;
            var tileW = Math.Max(32, tile.Width);
            var tileH = Math.Max(32, tile.Height);

            var yStartFallback = -(_backgroundOffset % tileH);
            for (var y = yStartFallback; y < clientRect.Height; y += tileH)
            {
                for (var x = 0; x < clientRect.Width; x += tileW)
                {
                    g.DrawImage(tile, x, y, tileW, tileH);
                }
            }

            return;
        }

        const int drawSize = 24;
        var oldInterpolation = g.InterpolationMode;
        var oldPixelOffset = g.PixelOffsetMode;
        g.InterpolationMode = InterpolationMode.NearestNeighbor;
        g.PixelOffsetMode = PixelOffsetMode.Half;
        _assets.StageBackgroundMaps.TryGetValue(stage, out var stageMap);

        var yStart = -(_backgroundOffset % drawSize) - drawSize;
        for (var y = yStart; y < clientRect.Height + drawSize; y += drawSize)
        {
            var row = (int)MathF.Floor((_backgroundOffset + y) / drawSize);
            for (var x = -drawSize; x < clientRect.Width + drawSize; x += drawSize)
            {
                var col = (int)MathF.Floor((float)x / drawSize);
                if (stageMap is null)
                {
                    var tileIndex = SelectBackgroundTileIndex(col, row, stage, tiles.Count);
                    var tile = tiles[tileIndex];
                    g.DrawImage(tile, x, y, drawSize, drawSize);
                    continue;
                }

                var mapSelection = SelectMapTile(stageMap, col, row, tiles.Count);
                var mapTile = tiles[mapSelection.TileIndex];
                DrawBackgroundTile(g, mapTile, x, y, drawSize, mapSelection.FlipX, mapSelection.FlipY);
            }
        }

        g.InterpolationMode = oldInterpolation;
        g.PixelOffsetMode = oldPixelOffset;
    }

    private IReadOnlyList<Bitmap> GetRenderableBackgroundTiles(int stage)
    {
        if (_renderableBackgroundTilesByStage.TryGetValue(stage, out var cached))
        {
            return cached;
        }

        if (!_assets.StageBackgroundTiles.TryGetValue(stage, out var stageTiles) || stageTiles.Count == 0)
        {
            _renderableBackgroundTilesByStage[stage] = [];
            return _renderableBackgroundTilesByStage[stage];
        }

        var filtered = stageTiles
            .Where(tile => CountOpaquePixels(tile) >= 24)
            .ToArray();

        _renderableBackgroundTilesByStage[stage] = filtered;
        return filtered;
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

    private static int SelectBackgroundTileIndex(int col, int row, int stage, int tileCount)
    {
        if (tileCount <= 1)
        {
            return 0;
        }

        unchecked
        {
            uint hash = (uint)(col * 73856093)
                        ^ (uint)(row * 19349663)
                        ^ (uint)(stage * 83492791);
            hash ^= hash >> 13;
            hash *= 1274126177;
            hash ^= hash >> 16;

            var index = (int)(hash % (uint)tileCount);
            if ((row & 0x7) == 0)
            {
                index = (index + (stage * 3)) % tileCount;
            }

            return index;
        }
    }

    private static (int TileIndex, bool FlipX, bool FlipY) SelectMapTile(GameAssets.StageBackgroundMap stageMap, int col, int row, int tileCount)
    {
        if (tileCount <= 1 || stageMap.Cells.Count == 0 || stageMap.Width <= 0 || stageMap.Height <= 0)
        {
            return (0, false, false);
        }

        var mapCol = WrapIndex(col, stageMap.Width);
        var mapRow = WrapIndex(row, stageMap.Height);
        var mapIndex = (mapRow * stageMap.Width) + mapCol;

        if (mapIndex < 0 || mapIndex >= stageMap.Cells.Count)
        {
            return (0, false, false);
        }

        var entry = stageMap.Cells[mapIndex];
        var attr = (entry >> 8) & 0xFF;
        var tileId = entry & 0xFF;

        var variant = attr & 0x3F;
        var tileIndex = (tileId + variant) % tileCount;
        var flipX = (attr & 0x40) != 0;
        var flipY = (attr & 0x80) != 0;

        return (tileIndex, flipX, flipY);
    }

    private static void DrawBackgroundTile(Graphics g, Bitmap tile, float x, float y, int size, bool flipX, bool flipY)
    {
        if (!flipX && !flipY)
        {
            g.DrawImage(tile, x, y, size, size);
            return;
        }

        var left = x;
        var top = y;
        var right = x + size;
        var bottom = y + size;

        PointF[] destPoints;
        if (flipX && flipY)
        {
            destPoints = [
                new PointF(right, bottom),
                new PointF(left, bottom),
                new PointF(right, top),
            ];
        }
        else if (flipX)
        {
            destPoints = [
                new PointF(right, top),
                new PointF(left, top),
                new PointF(right, bottom),
            ];
        }
        else
        {
            destPoints = [
                new PointF(left, bottom),
                new PointF(right, bottom),
                new PointF(left, top),
            ];
        }

        g.DrawImage(tile, destPoints);
    }

    private static int WrapIndex(int value, int modulus)
    {
        if (modulus <= 0)
        {
            return 0;
        }

        var wrapped = value % modulus;
        return wrapped < 0 ? wrapped + modulus : wrapped;
    }

    private void DrawHudText(Graphics g, string hudText, float x, float y)
    {
        if (_assets.HudFont is not null)
        {
            _assets.HudFont.DrawString(g, hudText, x, y, scale: 1.2f, tracking: 1f);
            return;
        }

        using var hudBrush = new SolidBrush(Color.FromArgb(230, 220, 255, 240));
        using var hudFont = new Font("Consolas", 12f, FontStyle.Bold);
        g.DrawString(hudText, hudFont, hudBrush, x, y);
    }

    private void DrawDebugOverlay(Graphics g, Rectangle clientRect)
    {
        if (!_debugOverlayEnabled)
        {
            return;
        }

        var stage = ((Math.Max(1, Stage) - 1) % 5) + 1;
        _assets.StageBackgroundMaps.TryGetValue(stage, out var stageMap);
        var tiles = GetRenderableBackgroundTiles(stage);

        const int drawSize = 24;
        var viewportRow = (int)MathF.Floor((_backgroundOffset + (clientRect.Height * 0.5f)) / drawSize);
        var viewportCol = Math.Max(0, clientRect.Width / (2 * drawSize));
        var fps = _lastDeltaSeconds > 0f ? 1f / _lastDeltaSeconds : 0f;

        var lines = new List<string>
        {
            $"DEBUG F3 TOGGLE: {(DebugOverlayEnabled ? "ON" : "OFF")}",
            $"fps {fps,6:0.0}  dt {_lastDeltaSeconds,7:0.0000}s",
            $"player x{_playerBounds.X,6:0.0} y{_playerBounds.Y,6:0.0}",
            $"bullets {_bullets.Count,3}  enemies {_enemies.Count,3}  explosions {_explosions.Count,3}",
            $"stage {stage}  bgOffset {_backgroundOffset,8:0.0}  stageTimer {_stageTimer,6:0.00}",
            $"bgTiles {tiles.Count,4}  map {(stageMap is null ? "missing" : $"{stageMap.Width}x{stageMap.Height} ({stageMap.Cells.Count})")}",
        };

        if (stageMap is not null && stageMap.Width > 0 && stageMap.Height > 0 && stageMap.Cells.Count > 0)
        {
            var mapCol = WrapIndex(viewportCol, stageMap.Width);
            var mapRow = WrapIndex(viewportRow, stageMap.Height);
            var mapIndex = (mapRow * stageMap.Width) + mapCol;
            if (mapIndex >= 0 && mapIndex < stageMap.Cells.Count)
            {
                var entry = stageMap.Cells[mapIndex];
                var attr = (entry >> 8) & 0xFF;
                var rawTile = entry & 0xFF;
                var variant = attr & 0x3F;
                var flipX = (attr & 0x40) != 0;
                var flipY = (attr & 0x80) != 0;
                var tileIndex = tiles.Count > 0 ? (rawTile + variant) % tiles.Count : 0;

                lines.Add($"sample rc {mapRow,4},{mapCol,4} idx {mapIndex,5}");
                lines.Add($"entry 0x{entry:X4} attr 0x{attr:X2} tile {rawTile,3} var {variant,2} fx {(flipX ? 1 : 0)} fy {(flipY ? 1 : 0)} -> {tileIndex,3}");
            }
        }

        using var font = new Font("Consolas", 10f, FontStyle.Regular);
        var maxTextWidth = 0f;
        foreach (var line in lines)
        {
            maxTextWidth = Math.Max(maxTextWidth, g.MeasureString(line, font).Width);
        }

        var lineHeight = font.GetHeight(g) + 1f;
        var panelWidth = maxTextWidth + 14f;
        var panelHeight = (lineHeight * lines.Count) + 10f;
        var panelX = 10f;
        var panelY = Math.Max(58f, clientRect.Height - panelHeight - 12f);

        using var panelFill = new SolidBrush(Color.FromArgb(170, 0, 0, 0));
        using var panelStroke = new Pen(Color.FromArgb(180, 90, 255, 210), 1f);
        using var textBrush = new SolidBrush(Color.FromArgb(245, 220, 255, 245));

        g.FillRectangle(panelFill, panelX, panelY, panelWidth, panelHeight);
        g.DrawRectangle(panelStroke, panelX, panelY, panelWidth, panelHeight);

        var textY = panelY + 5f;
        foreach (var line in lines)
        {
            g.DrawString(line, font, textBrush, panelX + 7f, textY);
            textY += lineHeight;
        }
    }
}
