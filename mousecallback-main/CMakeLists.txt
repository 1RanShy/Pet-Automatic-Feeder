cmake_minimum_required(VERSION 3.10.0)

set( CMAKE_CXX_COMPILER "D:/Softwares/C_Compile/mingw64/bin/g++.exe" )  

set( CMAKE_C_COMPILER "D:/Softwares/C_Compile/mingw64/bin/gcc.exe" )  

project(mousecallback)

find_package(Threads)

set(CMAKE_CXX_STANDARD 11)

ADD_EXECUTABLE(CMouse mouse.cpp main.cpp ${CMAKE_THREAD_LIBS_INIT})
# cmake . -G "MinGW Makefiles"
# mingw32-make