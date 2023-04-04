cmake_minimum_required(VERSION 3.10.0)

#set( CMAKE_CXX_COMPILER "D:/Softwares/C_Compile/mingw64/bin/g++.exe" )  

#set( CMAKE_C_COMPILER "D:/Softwares/C_Compile/mingw64/bin/gcc.exe" )  

project(main)# 工程名 

find_library(WIRINGPI_LIBRARIES NAMES wiringPi)

find_library(PIGPIO_LIBRARIES NAMES pigpio)

include_directories(include) #包含头文件目录

# file(GLOB SOURCE "src/*.cpp" "main.cpp")# 源文件下所有的 cpp文件 和主程序

add_executable(main "main.cpp" "../src/hx711.cpp" )

target_link_libraries(main ${WIRINGPI_LIBRARIES})

target_link_libraries(main ${PIGPIO_LIBRARIES})

# 需要执行的cpp才写在这里面 class这种不需要执行的cpp就不用写在这里面

if(COMMAND cmake_policy)
   cmake_policy(SET CMP0000 NEW)
endif()

if(COMMAND cmake_minimum_required)
   cmake_minimum_required(VERSION 2.8)
endif()

# Force cmake to use current timestamp to avoid clock skew errors
execute_process(COMMAND date +%s OUTPUT_VARIABLE BUILD_TIMESTAMP)
add_definitions(-DBUILD_TIMESTAMP=${BUILD_TIMESTAMP})

