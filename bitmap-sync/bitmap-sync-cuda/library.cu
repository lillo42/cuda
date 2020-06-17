#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#define _USE_MATH_DEFINES
#include <math.h>

__global__ void kernel(unsigned char* src) {
    __shared__ float temp[16][16];

    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;
    int offset = x + y * blockDim.x * gridDim.x;

    const float period = 128.0f;

    temp[threadIdx.x][threadIdx.y] = 255 *
            (sinf(x * 2.0f * M_PI/period) + 1.0f) *
            (sinf(y * 2.0f * M_PI/period) + 1.0f) / 4.0f;

    __syncthreads();

    src[offset * 4] = 0;
    src[offset * 4 + 1] = temp[15 - threadIdx.x][15 - threadIdx.y];
    src[offset * 4 + 2] = 0;
    src[offset * 4 + 3] = 255;

}

extern "C" __declspec(dllexport) void GenerateBitmap(unsigned char* dst, int dimension) {
    int size = dimension * dimension * 4;
    cudaError_t  status;

    unsigned char* src;
    status = cudaMalloc(&src, size);

    dim3 blocks(dimension / 16, dimension / 16);
    dim3 threads(16, 16);

    kernel<<<blocks, threads>>>(src);

    cudaMemcpy(dst, src, size, cudaMemcpyDeviceToHost);

    cudaFree(src);
}