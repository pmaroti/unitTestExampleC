# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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
CMAKE_SOURCE_DIR = /home/maro/stuff/cUnitTest/cmocka-1.0.0

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/maro/stuff/cUnitTest/cmocka-1.0.0/build

# Include any dependencies generated for this target.
include example/CMakeFiles/product_database_test.dir/depend.make

# Include the progress variables for this target.
include example/CMakeFiles/product_database_test.dir/progress.make

# Include the compile flags for this target's objects.
include example/CMakeFiles/product_database_test.dir/flags.make

example/CMakeFiles/product_database_test.dir/product_database.c.o: example/CMakeFiles/product_database_test.dir/flags.make
example/CMakeFiles/product_database_test.dir/product_database.c.o: ../example/product_database.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/maro/stuff/cUnitTest/cmocka-1.0.0/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object example/CMakeFiles/product_database_test.dir/product_database.c.o"
	cd /home/maro/stuff/cUnitTest/cmocka-1.0.0/build/example && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/product_database_test.dir/product_database.c.o   -c /home/maro/stuff/cUnitTest/cmocka-1.0.0/example/product_database.c

example/CMakeFiles/product_database_test.dir/product_database.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/product_database_test.dir/product_database.c.i"
	cd /home/maro/stuff/cUnitTest/cmocka-1.0.0/build/example && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/maro/stuff/cUnitTest/cmocka-1.0.0/example/product_database.c > CMakeFiles/product_database_test.dir/product_database.c.i

example/CMakeFiles/product_database_test.dir/product_database.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/product_database_test.dir/product_database.c.s"
	cd /home/maro/stuff/cUnitTest/cmocka-1.0.0/build/example && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/maro/stuff/cUnitTest/cmocka-1.0.0/example/product_database.c -o CMakeFiles/product_database_test.dir/product_database.c.s

example/CMakeFiles/product_database_test.dir/product_database.c.o.requires:
.PHONY : example/CMakeFiles/product_database_test.dir/product_database.c.o.requires

example/CMakeFiles/product_database_test.dir/product_database.c.o.provides: example/CMakeFiles/product_database_test.dir/product_database.c.o.requires
	$(MAKE) -f example/CMakeFiles/product_database_test.dir/build.make example/CMakeFiles/product_database_test.dir/product_database.c.o.provides.build
.PHONY : example/CMakeFiles/product_database_test.dir/product_database.c.o.provides

example/CMakeFiles/product_database_test.dir/product_database.c.o.provides.build: example/CMakeFiles/product_database_test.dir/product_database.c.o

example/CMakeFiles/product_database_test.dir/product_database_test.c.o: example/CMakeFiles/product_database_test.dir/flags.make
example/CMakeFiles/product_database_test.dir/product_database_test.c.o: ../example/product_database_test.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/maro/stuff/cUnitTest/cmocka-1.0.0/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object example/CMakeFiles/product_database_test.dir/product_database_test.c.o"
	cd /home/maro/stuff/cUnitTest/cmocka-1.0.0/build/example && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/product_database_test.dir/product_database_test.c.o   -c /home/maro/stuff/cUnitTest/cmocka-1.0.0/example/product_database_test.c

example/CMakeFiles/product_database_test.dir/product_database_test.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/product_database_test.dir/product_database_test.c.i"
	cd /home/maro/stuff/cUnitTest/cmocka-1.0.0/build/example && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/maro/stuff/cUnitTest/cmocka-1.0.0/example/product_database_test.c > CMakeFiles/product_database_test.dir/product_database_test.c.i

example/CMakeFiles/product_database_test.dir/product_database_test.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/product_database_test.dir/product_database_test.c.s"
	cd /home/maro/stuff/cUnitTest/cmocka-1.0.0/build/example && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/maro/stuff/cUnitTest/cmocka-1.0.0/example/product_database_test.c -o CMakeFiles/product_database_test.dir/product_database_test.c.s

example/CMakeFiles/product_database_test.dir/product_database_test.c.o.requires:
.PHONY : example/CMakeFiles/product_database_test.dir/product_database_test.c.o.requires

example/CMakeFiles/product_database_test.dir/product_database_test.c.o.provides: example/CMakeFiles/product_database_test.dir/product_database_test.c.o.requires
	$(MAKE) -f example/CMakeFiles/product_database_test.dir/build.make example/CMakeFiles/product_database_test.dir/product_database_test.c.o.provides.build
.PHONY : example/CMakeFiles/product_database_test.dir/product_database_test.c.o.provides

example/CMakeFiles/product_database_test.dir/product_database_test.c.o.provides.build: example/CMakeFiles/product_database_test.dir/product_database_test.c.o

# Object files for target product_database_test
product_database_test_OBJECTS = \
"CMakeFiles/product_database_test.dir/product_database.c.o" \
"CMakeFiles/product_database_test.dir/product_database_test.c.o"

# External object files for target product_database_test
product_database_test_EXTERNAL_OBJECTS =

example/product_database_test: example/CMakeFiles/product_database_test.dir/product_database.c.o
example/product_database_test: example/CMakeFiles/product_database_test.dir/product_database_test.c.o
example/product_database_test: example/CMakeFiles/product_database_test.dir/build.make
example/product_database_test: src/libcmocka.so.0.3.0
example/product_database_test: /usr/lib/x86_64-linux-gnu/librt.so
example/product_database_test: example/CMakeFiles/product_database_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable product_database_test"
	cd /home/maro/stuff/cUnitTest/cmocka-1.0.0/build/example && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/product_database_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
example/CMakeFiles/product_database_test.dir/build: example/product_database_test
.PHONY : example/CMakeFiles/product_database_test.dir/build

example/CMakeFiles/product_database_test.dir/requires: example/CMakeFiles/product_database_test.dir/product_database.c.o.requires
example/CMakeFiles/product_database_test.dir/requires: example/CMakeFiles/product_database_test.dir/product_database_test.c.o.requires
.PHONY : example/CMakeFiles/product_database_test.dir/requires

example/CMakeFiles/product_database_test.dir/clean:
	cd /home/maro/stuff/cUnitTest/cmocka-1.0.0/build/example && $(CMAKE_COMMAND) -P CMakeFiles/product_database_test.dir/cmake_clean.cmake
.PHONY : example/CMakeFiles/product_database_test.dir/clean

example/CMakeFiles/product_database_test.dir/depend:
	cd /home/maro/stuff/cUnitTest/cmocka-1.0.0/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/maro/stuff/cUnitTest/cmocka-1.0.0 /home/maro/stuff/cUnitTest/cmocka-1.0.0/example /home/maro/stuff/cUnitTest/cmocka-1.0.0/build /home/maro/stuff/cUnitTest/cmocka-1.0.0/build/example /home/maro/stuff/cUnitTest/cmocka-1.0.0/build/example/CMakeFiles/product_database_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : example/CMakeFiles/product_database_test.dir/depend

