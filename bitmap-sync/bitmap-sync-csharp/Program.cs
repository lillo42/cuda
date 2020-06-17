using System;
using SkiaSharp;

namespace BitmapSync
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            
            var dim = 512;
            var bit = new SKBitmap(dim, dim);
            NativeMethods.GenerateBitmap(bit.Handle, dim);
            
            Console.WriteLine("Bit map fill");
        }
    }
}
