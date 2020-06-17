using System;
using System.Runtime.InteropServices;

namespace BitmapSync
{
    public static class NativeMethods
    {
        [DllImport("BitmapSyncCpp", CallingConvention = CallingConvention.Cdecl)]
        public static extern void GenerateBitmap(IntPtr src, int dimension);
    }
}