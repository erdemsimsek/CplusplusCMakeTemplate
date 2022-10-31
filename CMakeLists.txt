cmake_minimum_required(VERSION 3.10.0)

set(PROJECT_NAME "CLI_INTERFACE")

project(${PROJECT_NAME} VERSION 0.1.0)

include(CTest)
enable_testing()

# Finding boost package and including boost header files
set(Boost_USE_STATIC_LIBS ON)
set(Boost_USE_MULTITHREADED ON)
find_package(Boost REQUIRED program_options)
include_directories(${BOOST_INCLUDE_DIRS})

# Third party directory lists to ignore while running clang-format
set(PROJECT_TRDPARTY_DIR "build/")

# Adding cpp check rules
include(cppcheck.cmake)

# Adding clang-format rules
include(clang-format.cmake)

include(clang-tidy.cmake)

add_executable(${PROJECT_NAME} main.cpp)

# set CXX_CLANG_TIDY property after defining the target
set_target_properties(${PROJECT_NAME} PROPERTIES CXX_CLANG_TIDY "${CLANG_TIDY_COMMAND}")

# Lkinking boost libraries with the application
target_link_libraries(${PROJECT_NAME} ${Boost_LIBRARIES})

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
