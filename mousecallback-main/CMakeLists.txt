cmake_minimum_required(VERSION 3.10.0)

project(mousecallback)

find_package(Threads)

set(CMAKE_CXX_STANDARD 11)

ADD_EXECUTABLE(CMouse mouse.cpp main.cpp ${CMAKE_THREAD_LIBS_INIT})
