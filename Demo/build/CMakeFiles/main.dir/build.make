# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ranshy/Desktop/RanShuai/Demo

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ranshy/Desktop/RanShuai/Demo/build

# Include any dependencies generated for this target.
include CMakeFiles/main.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/main.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/main.dir/flags.make

CMakeFiles/main.dir/main.cpp.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ranshy/Desktop/RanShuai/Demo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/main.dir/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main.dir/main.cpp.o -c /home/ranshy/Desktop/RanShuai/Demo/main.cpp

CMakeFiles/main.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ranshy/Desktop/RanShuai/Demo/main.cpp > CMakeFiles/main.dir/main.cpp.i

CMakeFiles/main.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ranshy/Desktop/RanShuai/Demo/main.cpp -o CMakeFiles/main.dir/main.cpp.s

CMakeFiles/main.dir/src/SR04.cpp.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/SR04.cpp.o: ../src/SR04.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ranshy/Desktop/RanShuai/Demo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/main.dir/src/SR04.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main.dir/src/SR04.cpp.o -c /home/ranshy/Desktop/RanShuai/Demo/src/SR04.cpp

CMakeFiles/main.dir/src/SR04.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/src/SR04.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ranshy/Desktop/RanShuai/Demo/src/SR04.cpp > CMakeFiles/main.dir/src/SR04.cpp.i

CMakeFiles/main.dir/src/SR04.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/src/SR04.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ranshy/Desktop/RanShuai/Demo/src/SR04.cpp -o CMakeFiles/main.dir/src/SR04.cpp.s

CMakeFiles/main.dir/src/Servo.cpp.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/Servo.cpp.o: ../src/Servo.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ranshy/Desktop/RanShuai/Demo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/main.dir/src/Servo.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main.dir/src/Servo.cpp.o -c /home/ranshy/Desktop/RanShuai/Demo/src/Servo.cpp

CMakeFiles/main.dir/src/Servo.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/src/Servo.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ranshy/Desktop/RanShuai/Demo/src/Servo.cpp > CMakeFiles/main.dir/src/Servo.cpp.i

CMakeFiles/main.dir/src/Servo.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/src/Servo.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ranshy/Desktop/RanShuai/Demo/src/Servo.cpp -o CMakeFiles/main.dir/src/Servo.cpp.s

CMakeFiles/main.dir/src/AddFood.cpp.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/AddFood.cpp.o: ../src/AddFood.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ranshy/Desktop/RanShuai/Demo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/main.dir/src/AddFood.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main.dir/src/AddFood.cpp.o -c /home/ranshy/Desktop/RanShuai/Demo/src/AddFood.cpp

CMakeFiles/main.dir/src/AddFood.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/src/AddFood.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ranshy/Desktop/RanShuai/Demo/src/AddFood.cpp > CMakeFiles/main.dir/src/AddFood.cpp.i

CMakeFiles/main.dir/src/AddFood.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/src/AddFood.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ranshy/Desktop/RanShuai/Demo/src/AddFood.cpp -o CMakeFiles/main.dir/src/AddFood.cpp.s

CMakeFiles/main.dir/src/Blue.cpp.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/Blue.cpp.o: ../src/Blue.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ranshy/Desktop/RanShuai/Demo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/main.dir/src/Blue.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main.dir/src/Blue.cpp.o -c /home/ranshy/Desktop/RanShuai/Demo/src/Blue.cpp

CMakeFiles/main.dir/src/Blue.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/src/Blue.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ranshy/Desktop/RanShuai/Demo/src/Blue.cpp > CMakeFiles/main.dir/src/Blue.cpp.i

CMakeFiles/main.dir/src/Blue.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/src/Blue.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ranshy/Desktop/RanShuai/Demo/src/Blue.cpp -o CMakeFiles/main.dir/src/Blue.cpp.s

CMakeFiles/main.dir/src/BlueSendReceive.cpp.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/BlueSendReceive.cpp.o: ../src/BlueSendReceive.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ranshy/Desktop/RanShuai/Demo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/main.dir/src/BlueSendReceive.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main.dir/src/BlueSendReceive.cpp.o -c /home/ranshy/Desktop/RanShuai/Demo/src/BlueSendReceive.cpp

CMakeFiles/main.dir/src/BlueSendReceive.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/src/BlueSendReceive.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ranshy/Desktop/RanShuai/Demo/src/BlueSendReceive.cpp > CMakeFiles/main.dir/src/BlueSendReceive.cpp.i

CMakeFiles/main.dir/src/BlueSendReceive.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/src/BlueSendReceive.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ranshy/Desktop/RanShuai/Demo/src/BlueSendReceive.cpp -o CMakeFiles/main.dir/src/BlueSendReceive.cpp.s

CMakeFiles/main.dir/src/Pump.cpp.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/Pump.cpp.o: ../src/Pump.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ranshy/Desktop/RanShuai/Demo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/main.dir/src/Pump.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main.dir/src/Pump.cpp.o -c /home/ranshy/Desktop/RanShuai/Demo/src/Pump.cpp

CMakeFiles/main.dir/src/Pump.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/src/Pump.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ranshy/Desktop/RanShuai/Demo/src/Pump.cpp > CMakeFiles/main.dir/src/Pump.cpp.i

CMakeFiles/main.dir/src/Pump.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/src/Pump.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ranshy/Desktop/RanShuai/Demo/src/Pump.cpp -o CMakeFiles/main.dir/src/Pump.cpp.s

CMakeFiles/main.dir/src/HumanSensor.cpp.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/HumanSensor.cpp.o: ../src/HumanSensor.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ranshy/Desktop/RanShuai/Demo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/main.dir/src/HumanSensor.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main.dir/src/HumanSensor.cpp.o -c /home/ranshy/Desktop/RanShuai/Demo/src/HumanSensor.cpp

CMakeFiles/main.dir/src/HumanSensor.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/src/HumanSensor.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ranshy/Desktop/RanShuai/Demo/src/HumanSensor.cpp > CMakeFiles/main.dir/src/HumanSensor.cpp.i

CMakeFiles/main.dir/src/HumanSensor.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/src/HumanSensor.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ranshy/Desktop/RanShuai/Demo/src/HumanSensor.cpp -o CMakeFiles/main.dir/src/HumanSensor.cpp.s

# Object files for target main
main_OBJECTS = \
"CMakeFiles/main.dir/main.cpp.o" \
"CMakeFiles/main.dir/src/SR04.cpp.o" \
"CMakeFiles/main.dir/src/Servo.cpp.o" \
"CMakeFiles/main.dir/src/AddFood.cpp.o" \
"CMakeFiles/main.dir/src/Blue.cpp.o" \
"CMakeFiles/main.dir/src/BlueSendReceive.cpp.o" \
"CMakeFiles/main.dir/src/Pump.cpp.o" \
"CMakeFiles/main.dir/src/HumanSensor.cpp.o"

# External object files for target main
main_EXTERNAL_OBJECTS =

main: CMakeFiles/main.dir/main.cpp.o
main: CMakeFiles/main.dir/src/SR04.cpp.o
main: CMakeFiles/main.dir/src/Servo.cpp.o
main: CMakeFiles/main.dir/src/AddFood.cpp.o
main: CMakeFiles/main.dir/src/Blue.cpp.o
main: CMakeFiles/main.dir/src/BlueSendReceive.cpp.o
main: CMakeFiles/main.dir/src/Pump.cpp.o
main: CMakeFiles/main.dir/src/HumanSensor.cpp.o
main: CMakeFiles/main.dir/build.make
main: /usr/local/lib/libpigpio.so
main: CMakeFiles/main.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ranshy/Desktop/RanShuai/Demo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Linking CXX executable main"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/main.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/main.dir/build: main

.PHONY : CMakeFiles/main.dir/build

CMakeFiles/main.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/main.dir/cmake_clean.cmake
.PHONY : CMakeFiles/main.dir/clean

CMakeFiles/main.dir/depend:
	cd /home/ranshy/Desktop/RanShuai/Demo/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ranshy/Desktop/RanShuai/Demo /home/ranshy/Desktop/RanShuai/Demo /home/ranshy/Desktop/RanShuai/Demo/build /home/ranshy/Desktop/RanShuai/Demo/build /home/ranshy/Desktop/RanShuai/Demo/build/CMakeFiles/main.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/main.dir/depend

