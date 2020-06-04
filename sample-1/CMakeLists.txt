cmake_minimum_required(VERSION 3.16)

#set(CMAKE_C_COMPILER /usr/bin/gcc-7)
#set(CMAKE_CXX_COMPILER /usr/bin/g++-7)

project(sample_1 CUDA)

set(CMAKE_CUDA_STANDARD 14)

add_executable(sample_1 main.cu)

set_target_properties(
        sample_1
        PROPERTIES
        CUDA_SEPARABLE_COMPILATION ON)