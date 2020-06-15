cmake_minimum_required(VERSION 3.16)
project(scan CUDA)

set(CMAKE_CUDA_STANDARD 14)

add_executable(scan main.cu)

set_target_properties(
        scan
        PROPERTIES
        CUDA_SEPARABLE_COMPILATION ON)