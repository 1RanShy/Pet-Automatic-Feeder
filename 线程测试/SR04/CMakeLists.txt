cmake_minimum_required(VERSION 3.10.0)

#set( CMAKE_CXX_COMPILER "D:/Softwares/C_Compile/mingw64/bin/g++.exe" )  

#set( CMAKE_C_COMPILER "D:/Softwares/C_Compile/mingw64/bin/gcc.exe" )  

set(CMAKE_DISABLE_SOURCE_CHANGES ON)
set(CMAKE_DISABLE_IN_SOURCE_BUILD ON) 

project(main)# 工程名 

find_library(WIRINGPI_LIBRARIES NAMES wiringPi)

find_library(PIGPIO_LIBRARIES NAMES pigpio)

include_directories(include) #包含头文件目录

# file(GLOB SOURCE "src/*.cpp" "main.cpp")# 源文件下所有的 cpp文件 和主程序

add_executable(main "main.cpp" "../src/SR04.cpp" "../src/pump_control.cpp" "../src/AddWater.cpp")

target_link_libraries(main ${PIGPIO_LIBRARIES})

target_link_libraries(main pthread)

# 需要执行的cpp才写在这里面 class这种不需要执行的cpp就不用写在这里面
