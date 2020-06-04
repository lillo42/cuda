#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <iostream>
using namespace std;

int main() {
    int count;
    cudaGetDeviceCount(&count);

    cudaDeviceProp prop;

    for (int i = 0; i < count; ++i) {
        cudaGetDeviceProperties(&prop, i);

        cout << "Device" << i << prop.name << endl;
        cout << "Compute capability" << prop.major << "." << prop.minor << "." << endl;

        cout << "Max grid dimensions: ("
            << prop.maxGridSize[0] << " x "
            << prop.maxGridSize[1] << " x "
            << prop.maxGridSize[2] << ")" << endl;

        cout << "Max block dimensions: ("
             << prop.maxThreadsDim[0] << " x "
             << prop.maxThreadsDim[1] << " x "
             << prop.maxThreadsDim[2] << ")" << endl;
    }

    return 0;
}
