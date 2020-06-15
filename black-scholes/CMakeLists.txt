cmake_minimum_required(VERSION 3.16)
project(black_scholes CUDA)

set(CMAKE_CUDA_STANDARD 14)

add_executable(black_scholes main.cu)

set_target_properties(
        black_scholes
        PROPERTIES
        CUDA_SEPARABLE_COMPILATION ON)