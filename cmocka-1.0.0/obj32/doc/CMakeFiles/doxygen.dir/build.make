# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.1

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
CMAKE_SOURCE_DIR = /home/asn/workspace/projects/cmocka

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/asn/workspace/projects/cmocka/obj32

# Utility rule file for doxygen.

# Include the progress variables for this target.
include doc/CMakeFiles/doxygen.dir/progress.make

doc/CMakeFiles/doxygen:
	$(CMAKE_COMMAND) -E cmake_progress_report /home/asn/workspace/projects/cmocka/obj32/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Writing documentation to /home/asn/workspace/projects/cmocka/obj32/doc/doc..."
	cd /home/asn/workspace/projects/cmocka/doc && /usr/bin/doxygen /home/asn/workspace/projects/cmocka/obj32/doc/Doxyfile

doxygen: doc/CMakeFiles/doxygen
doxygen: doc/CMakeFiles/doxygen.dir/build.make
.PHONY : doxygen

# Rule to build all files generated by this target.
doc/CMakeFiles/doxygen.dir/build: doxygen
.PHONY : doc/CMakeFiles/doxygen.dir/build

doc/CMakeFiles/doxygen.dir/clean:
	cd /home/asn/workspace/projects/cmocka/obj32/doc && $(CMAKE_COMMAND) -P CMakeFiles/doxygen.dir/cmake_clean.cmake
.PHONY : doc/CMakeFiles/doxygen.dir/clean

doc/CMakeFiles/doxygen.dir/depend:
	cd /home/asn/workspace/projects/cmocka/obj32 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/asn/workspace/projects/cmocka /home/asn/workspace/projects/cmocka/doc /home/asn/workspace/projects/cmocka/obj32 /home/asn/workspace/projects/cmocka/obj32/doc /home/asn/workspace/projects/cmocka/obj32/doc/CMakeFiles/doxygen.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : doc/CMakeFiles/doxygen.dir/depend

