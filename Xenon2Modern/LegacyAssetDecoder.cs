using System.Drawing.Imaging;

namespace Xenon2Modern;

public static class LegacyAssetDecoder
{
    public static Bitmap DecodeIndexedBytesAsGrayscale(ReadOnlySpan<byte> bytes, int width)
    {
        if (bytes.IsEmpty)
        {
            return new Bitmap(1, 1, PixelFormat.Format32bppArgb);
        }

        if (width <= 0)
        {
            width = 256;
        }

        var height = (int)Math.Ceiling(bytes.Length / (double)width);
        var bitmap = new Bitmap(width, height, PixelFormat.Format32bppArgb);
        var rect = new Rectangle(0, 0, bitmap.Width, bitmap.Height);
        var data = bitmap.LockBits(rect, ImageLockMode.WriteOnly, PixelFormat.Format32bppArgb);

        try
        {
            unsafe
            {
                var destination = (byte*)data.Scan0;
                for (var y = 0; y < height; y++)
                {
                    var row = destination + (y * data.Stride);
                    for (var x = 0; x < width; x++)
                    {
                        var index = (y * width) + x;
                        var value = index < bytes.Length ? bytes[index] : (byte)0;
                        var pixelOffset = x * 4;

                        row[pixelOffset] = value;
                        row[pixelOffset + 1] = value;
                        row[pixelOffset + 2] = value;
                        row[pixelOffset + 3] = 255;
                    }
                }
            }
        }
        finally
        {
            bitmap.UnlockBits(data);
        }

        return bitmap;
    }
}
