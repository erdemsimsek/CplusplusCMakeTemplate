cmake_minimum_required(VERSION 3.10.0)

find_program(CLANG_TIDY NAMES clang-tidy)
if (CLANG_TIDY)
    message(STATUS "clang-tidy is found in the system")
    set(CMAKE_CXX_CLANG_TIDY clang-tidy)
else()
    message(ERROR "clang-tidy couldn't be found in the system")
endif()

