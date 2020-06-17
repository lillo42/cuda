using System;
using System.Runtime.InteropServices;

namespace BitmapSync
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            
            var dim = 512;
            //var bit = new SKBitmap(dim, dim)/
            var array = new int[dim][];
            for (var i = 0; i < dim; i++)
            {
                array[i] = new int[dim];
            }
            
            var handle = GCHandle.Alloc(array, GCHandleType.Pinned);
            try
            {
                var point = handle.AddrOfPinnedObject();
                NativeMethods.GenerateBitmap(point, dim);
            }
            finally
            {
                if (handle.IsAllocated)
                {
                    handle.Free();
                }
            }
            
            Console.WriteLine("Bit map fill");
        }
    }
}
