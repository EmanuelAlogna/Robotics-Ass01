# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/emanuel/catkin_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/emanuel/catkin_ws/build

# Include any dependencies generated for this target.
include pub_sub_same/CMakeFiles/test_pub.dir/depend.make

# Include the progress variables for this target.
include pub_sub_same/CMakeFiles/test_pub.dir/progress.make

# Include the compile flags for this target's objects.
include pub_sub_same/CMakeFiles/test_pub.dir/flags.make

pub_sub_same/CMakeFiles/test_pub.dir/src/test_pub.cpp.o: pub_sub_same/CMakeFiles/test_pub.dir/flags.make
pub_sub_same/CMakeFiles/test_pub.dir/src/test_pub.cpp.o: /home/emanuel/catkin_ws/src/pub_sub_same/src/test_pub.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/emanuel/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object pub_sub_same/CMakeFiles/test_pub.dir/src/test_pub.cpp.o"
	cd /home/emanuel/catkin_ws/build/pub_sub_same && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test_pub.dir/src/test_pub.cpp.o -c /home/emanuel/catkin_ws/src/pub_sub_same/src/test_pub.cpp

pub_sub_same/CMakeFiles/test_pub.dir/src/test_pub.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_pub.dir/src/test_pub.cpp.i"
	cd /home/emanuel/catkin_ws/build/pub_sub_same && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/emanuel/catkin_ws/src/pub_sub_same/src/test_pub.cpp > CMakeFiles/test_pub.dir/src/test_pub.cpp.i

pub_sub_same/CMakeFiles/test_pub.dir/src/test_pub.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_pub.dir/src/test_pub.cpp.s"
	cd /home/emanuel/catkin_ws/build/pub_sub_same && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/emanuel/catkin_ws/src/pub_sub_same/src/test_pub.cpp -o CMakeFiles/test_pub.dir/src/test_pub.cpp.s

pub_sub_same/CMakeFiles/test_pub.dir/src/test_pub.cpp.o.requires:

.PHONY : pub_sub_same/CMakeFiles/test_pub.dir/src/test_pub.cpp.o.requires

pub_sub_same/CMakeFiles/test_pub.dir/src/test_pub.cpp.o.provides: pub_sub_same/CMakeFiles/test_pub.dir/src/test_pub.cpp.o.requires
	$(MAKE) -f pub_sub_same/CMakeFiles/test_pub.dir/build.make pub_sub_same/CMakeFiles/test_pub.dir/src/test_pub.cpp.o.provides.build
.PHONY : pub_sub_same/CMakeFiles/test_pub.dir/src/test_pub.cpp.o.provides

pub_sub_same/CMakeFiles/test_pub.dir/src/test_pub.cpp.o.provides.build: pub_sub_same/CMakeFiles/test_pub.dir/src/test_pub.cpp.o


# Object files for target test_pub
test_pub_OBJECTS = \
"CMakeFiles/test_pub.dir/src/test_pub.cpp.o"

# External object files for target test_pub
test_pub_EXTERNAL_OBJECTS =

/home/emanuel/catkin_ws/devel/lib/pub_sub_same/test_pub: pub_sub_same/CMakeFiles/test_pub.dir/src/test_pub.cpp.o
/home/emanuel/catkin_ws/devel/lib/pub_sub_same/test_pub: pub_sub_same/CMakeFiles/test_pub.dir/build.make
/home/emanuel/catkin_ws/devel/lib/pub_sub_same/test_pub: /opt/ros/kinetic/lib/libroscpp.so
/home/emanuel/catkin_ws/devel/lib/pub_sub_same/test_pub: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/emanuel/catkin_ws/devel/lib/pub_sub_same/test_pub: /usr/lib/x86_64-linux-gnu/libboost_signals.so
/home/emanuel/catkin_ws/devel/lib/pub_sub_same/test_pub: /opt/ros/kinetic/lib/librosconsole.so
/home/emanuel/catkin_ws/devel/lib/pub_sub_same/test_pub: /opt/ros/kinetic/lib/librosconsole_log4cxx.so
/home/emanuel/catkin_ws/devel/lib/pub_sub_same/test_pub: /opt/ros/kinetic/lib/librosconsole_backend_interface.so
/home/emanuel/catkin_ws/devel/lib/pub_sub_same/test_pub: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/emanuel/catkin_ws/devel/lib/pub_sub_same/test_pub: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/emanuel/catkin_ws/devel/lib/pub_sub_same/test_pub: /opt/ros/kinetic/lib/libroscpp_serialization.so
/home/emanuel/catkin_ws/devel/lib/pub_sub_same/test_pub: /opt/ros/kinetic/lib/libxmlrpcpp.so
/home/emanuel/catkin_ws/devel/lib/pub_sub_same/test_pub: /opt/ros/kinetic/lib/librostime.so
/home/emanuel/catkin_ws/devel/lib/pub_sub_same/test_pub: /opt/ros/kinetic/lib/libcpp_common.so
/home/emanuel/catkin_ws/devel/lib/pub_sub_same/test_pub: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/emanuel/catkin_ws/devel/lib/pub_sub_same/test_pub: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/emanuel/catkin_ws/devel/lib/pub_sub_same/test_pub: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
/home/emanuel/catkin_ws/devel/lib/pub_sub_same/test_pub: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/emanuel/catkin_ws/devel/lib/pub_sub_same/test_pub: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
/home/emanuel/catkin_ws/devel/lib/pub_sub_same/test_pub: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/emanuel/catkin_ws/devel/lib/pub_sub_same/test_pub: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so
/home/emanuel/catkin_ws/devel/lib/pub_sub_same/test_pub: pub_sub_same/CMakeFiles/test_pub.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/emanuel/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/emanuel/catkin_ws/devel/lib/pub_sub_same/test_pub"
	cd /home/emanuel/catkin_ws/build/pub_sub_same && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_pub.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
pub_sub_same/CMakeFiles/test_pub.dir/build: /home/emanuel/catkin_ws/devel/lib/pub_sub_same/test_pub

.PHONY : pub_sub_same/CMakeFiles/test_pub.dir/build

pub_sub_same/CMakeFiles/test_pub.dir/requires: pub_sub_same/CMakeFiles/test_pub.dir/src/test_pub.cpp.o.requires

.PHONY : pub_sub_same/CMakeFiles/test_pub.dir/requires

pub_sub_same/CMakeFiles/test_pub.dir/clean:
	cd /home/emanuel/catkin_ws/build/pub_sub_same && $(CMAKE_COMMAND) -P CMakeFiles/test_pub.dir/cmake_clean.cmake
.PHONY : pub_sub_same/CMakeFiles/test_pub.dir/clean

pub_sub_same/CMakeFiles/test_pub.dir/depend:
	cd /home/emanuel/catkin_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/emanuel/catkin_ws/src /home/emanuel/catkin_ws/src/pub_sub_same /home/emanuel/catkin_ws/build /home/emanuel/catkin_ws/build/pub_sub_same /home/emanuel/catkin_ws/build/pub_sub_same/CMakeFiles/test_pub.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : pub_sub_same/CMakeFiles/test_pub.dir/depend

