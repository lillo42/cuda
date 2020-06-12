cmake_minimum_required(VERSION 3.16)
project(reduce CUDA)

set(CMAKE_CUDA_STANDARD 14)

add_executable(reduce main.cu)

set_target_properties(
        reduce
        PROPERTIES
        CUDA_SEPARABLE_COMPILATION ON)