cmake_minimum_required(VERSION 3.10.0)

# set( CMAKE_CXX_COMPILER "D:/Softwares/C_Compile/mingw64/bin/g++.exe" )  

# set( CMAKE_C_COMPILER "D:/Softwares/C_Compile/mingw64/bin/gcc.exe" )  

project(main)

find_package(Threads)

set(CMAKE_CXX_STANDARD 11)

ADD_EXECUTABLE(main "scanf.cpp" "main.cpp")

target_link_libraries(main pthread)
# cmake . -G "MinGW Makefiles"
# mingw32-make