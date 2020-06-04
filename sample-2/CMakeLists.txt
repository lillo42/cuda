cmake_minimum_required(VERSION 3.16)
project(sample_2 CUDA)

set(CMAKE_CUDA_STANDARD 14)

add_executable(sample_2 main.cu)

set_target_properties(
        sample_2
        PROPERTIES
        CUDA_SEPARABLE_COMPILATION ON)