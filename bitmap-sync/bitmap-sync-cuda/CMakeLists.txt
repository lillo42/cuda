cmake_minimum_required(VERSION 3.16)
project(bitmap_sync_cuda CUDA)

set(CMAKE_CUDA_STANDARD 14)

add_library(bitmap_sync_cuda library.cu library.cuh)

set_target_properties(
        bitmap_sync_cuda
        PROPERTIES
        CUDA_SEPARABLE_COMPILATION ON)