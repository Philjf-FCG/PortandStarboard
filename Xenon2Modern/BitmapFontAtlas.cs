using System.Drawing.Imaging;

namespace Xenon2Modern;

public sealed class BitmapFontAtlas : IDisposable
{
    private readonly Dictionary<char, Bitmap> _glyphs;

    private BitmapFontAtlas(Dictionary<char, Bitmap> glyphs, int glyphWidth, int glyphHeight)
    {
        _glyphs = glyphs;
        GlyphWidth = glyphWidth;
        GlyphHeight = glyphHeight;
    }

    public int GlyphWidth { get; }

    public int GlyphHeight { get; }

    public static BitmapFontAtlas? TryCreateFromSmsSheet(Bitmap source)
    {
        const int columns = 18;
        const int rows = 5;

        if (source.Width < columns || source.Height < rows)
        {
            return null;
        }

        var cellW = source.Width / columns;
        var cellH = source.Height / rows;
        if (cellW <= 0 || cellH <= 0)
        {
            return null;
        }

        var mapRows = new[]
        {
            "ABCDEFGHIJKLMNOPQR",
            "STUVWXYZ!?.,:;+-*/",
            "()[]{}<>=_@#$%^&~\"",
            "0123456789         ",
            "                  ",
        };

        var bg = source.GetPixel(0, 0);
        var glyphs = new Dictionary<char, Bitmap>();

        for (var row = 0; row < rows; row++)
        {
            for (var col = 0; col < columns; col++)
            {
                var ch = mapRows[row][col];
                if (ch == ' ')
                {
                    continue;
                }

                var rect = new Rectangle(col * cellW, row * cellH, cellW, cellH);
                if (rect.Right > source.Width || rect.Bottom > source.Height)
                {
                    continue;
                }

                var tile = source.Clone(rect, PixelFormat.Format32bppArgb);
                RemoveBackground(tile, bg);

                if (!HasVisiblePixels(tile))
                {
                    tile.Dispose();
                    continue;
                }

                glyphs[ch] = tile;
            }
        }

        if (glyphs.Count == 0)
        {
            return null;
        }

        return new BitmapFontAtlas(glyphs, cellW, cellH);
    }

    public SizeF Measure(string text, float scale = 1f, float tracking = 1f)
    {
        if (string.IsNullOrEmpty(text))
        {
            return SizeF.Empty;
        }

        var width = 0f;
        var height = GlyphHeight * scale;
        foreach (var ch in text)
        {
            if (_glyphs.TryGetValue(ch, out var glyph) || _glyphs.TryGetValue(char.ToUpperInvariant(ch), out glyph))
            {
                width += glyph.Width * scale;
            }
            else
            {
                width += GlyphWidth * scale;
            }

            width += tracking;
        }

        if (width > 0)
        {
            width -= tracking;
        }

        return new SizeF(width, height);
    }

    public void DrawString(Graphics graphics, string text, float x, float y, float scale = 1f, float tracking = 1f)
    {
        if (string.IsNullOrEmpty(text))
        {
            return;
        }

        var cursorX = x;
        foreach (var ch in text)
        {
            if (!_glyphs.TryGetValue(ch, out var glyph) && !_glyphs.TryGetValue(char.ToUpperInvariant(ch), out glyph))
            {
                cursorX += (GlyphWidth * scale) + tracking;
                continue;
            }

            var w = glyph.Width * scale;
            var h = glyph.Height * scale;
            graphics.DrawImage(glyph, cursorX, y, w, h);
            cursorX += w + tracking;
        }
    }

    public void Dispose()
    {
        foreach (var glyph in _glyphs.Values)
        {
            glyph.Dispose();
        }
        _glyphs.Clear();
    }

    private static void RemoveBackground(Bitmap bitmap, Color bg)
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

    private static bool HasVisiblePixels(Bitmap bitmap)
    {
        for (var y = 0; y < bitmap.Height; y++)
        {
            for (var x = 0; x < bitmap.Width; x++)
            {
                if (bitmap.GetPixel(x, y).A > 10)
                {
                    return true;
                }
            }
        }

        return false;
    }
}
