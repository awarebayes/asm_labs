# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.20

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
CMAKE_COMMAND = /home/dev/Documents/utils/clion-2021.2.1/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/dev/Documents/utils/clion-2021.2.1/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/dev/Documents/programming/uni/asm_labs/3_test

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/dev/Documents/programming/uni/asm_labs/3_test/cmake-build-debug

# Utility rule file for 3_test_autogen.

# Include any custom commands dependencies for this target.
include CMakeFiles/3_test_autogen.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/3_test_autogen.dir/progress.make

CMakeFiles/3_test_autogen:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/dev/Documents/programming/uni/asm_labs/3_test/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Automatic MOC and UIC for target 3_test"
	/home/dev/Documents/utils/clion-2021.2.1/bin/cmake/linux/bin/cmake -E cmake_autogen /home/dev/Documents/programming/uni/asm_labs/3_test/cmake-build-debug/CMakeFiles/3_test_autogen.dir/AutogenInfo.json Debug

3_test_autogen: CMakeFiles/3_test_autogen
3_test_autogen: CMakeFiles/3_test_autogen.dir/build.make
.PHONY : 3_test_autogen

# Rule to build all files generated by this target.
CMakeFiles/3_test_autogen.dir/build: 3_test_autogen
.PHONY : CMakeFiles/3_test_autogen.dir/build

CMakeFiles/3_test_autogen.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/3_test_autogen.dir/cmake_clean.cmake
.PHONY : CMakeFiles/3_test_autogen.dir/clean

CMakeFiles/3_test_autogen.dir/depend:
	cd /home/dev/Documents/programming/uni/asm_labs/3_test/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/dev/Documents/programming/uni/asm_labs/3_test /home/dev/Documents/programming/uni/asm_labs/3_test /home/dev/Documents/programming/uni/asm_labs/3_test/cmake-build-debug /home/dev/Documents/programming/uni/asm_labs/3_test/cmake-build-debug /home/dev/Documents/programming/uni/asm_labs/3_test/cmake-build-debug/CMakeFiles/3_test_autogen.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/3_test_autogen.dir/depend

