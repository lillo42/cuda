cmake_minimum_required(VERSION 3.16)
project(map CUDA)

set(CMAKE_CUDA_STANDARD 14)
SET(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} -lcurand")

add_executable(map main.cu)

set_target_properties(
        map
        PROPERTIES
        CUDA_SEPARABLE_COMPILATION ON)