#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "HelloWorldLibrary::HelloWorldLibrary" for configuration ""
set_property(TARGET HelloWorldLibrary::HelloWorldLibrary APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(HelloWorldLibrary::HelloWorldLibrary PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "CXX"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libHelloWorldLibrary.a"
  )

list(APPEND _cmake_import_check_targets HelloWorldLibrary::HelloWorldLibrary )
list(APPEND _cmake_import_check_files_for_HelloWorldLibrary::HelloWorldLibrary "${_IMPORT_PREFIX}/lib/libHelloWorldLibrary.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
