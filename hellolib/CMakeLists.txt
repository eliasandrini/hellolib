cmake_minimum_required(VERSION 3.15)

project(HelloWorldLibrary VERSION 1.0 LANGUAGES CXX)

add_library(
  HelloWorldLibrary
  STATIC
  src/hellolib.cpp 
  include/hellolib.h)

target_include_directories(
  HelloWorldLibrary PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
                   $<INSTALL_INTERFACE:include>)

# part 2

include(GNUInstallDirs)

install(TARGETS HelloWorldLibrary
  EXPORT HelloWorldLibraryTargets
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  PUBLIC_HEADER DESTINATION include)

# NAMESPACE sets the namespace that your target will live within.
# you can have multiple targets under the same namespace
install(EXPORT HelloWorldLibraryTargets
  FILE HelloWorldLibraryTargets.cmake
  NAMESPACE HelloWorldLibrary::  
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/HelloWorldLibrary)

# this looks for your .cmake.in file that you created in step 1.
# if you set the directory differently you may need to handle this differently
include(CMakePackageConfigHelpers)

configure_package_config_file(
  ${CMAKE_CURRENT_LIST_DIR}/cmake/HelloWorldLibraryConfig.cmake.in
  "${CMAKE_CURRENT_BINARY_DIR}/HelloWorldLibraryConfig.cmake"
  INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/HelloWorldLibrary)

install(FILES
  "${CMAKE_CURRENT_BINARY_DIR}/HelloWorldLibraryConfig.cmake"
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/HelloWorldLibrary)

# actually install your header files
install(
    DIRECTORY include/
    DESTINATION ${CMAKE_INSTALL_PREFIX}/include
    FILES_MATCHING PATTERN "*.h*")

# Export targets to the build tree so find_package works with
# hello_lib_DIR=<build>
export(
  EXPORT HelloWorldLibraryTargets
  FILE "${CMAKE_CURRENT_BINARY_DIR}/HelloWorldLibraryTargets.cmake"
  NAMESPACE HelloWorldLibrary::)