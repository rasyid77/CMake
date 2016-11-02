include(Compiler/Clang)
__compiler_clang(C)

cmake_policy(GET CMP0025 appleClangPolicy)
if(WIN32 OR (APPLE AND NOT appleClangPolicy STREQUAL NEW))
  return()
endif()

if(NOT CMAKE_C_COMPILER_VERSION VERSION_LESS 3.4)
  set(CMAKE_C90_STANDARD_COMPILE_OPTION "-std=c90")
  set(CMAKE_C90_EXTENSION_COMPILE_OPTION "-std=gnu90")

  set(CMAKE_C99_STANDARD_COMPILE_OPTION "-std=c99")
  set(CMAKE_C99_EXTENSION_COMPILE_OPTION "-std=gnu99")

  set(CMAKE_C11_STANDARD_COMPILE_OPTION "-std=c11")
  set(CMAKE_C11_EXTENSION_COMPILE_OPTION "-std=gnu11")
endif()

if(NOT CMAKE_C_COMPILER_VERSION VERSION_LESS 3.4)
  if (NOT CMAKE_C_COMPILER_FORCED)
    if (NOT CMAKE_C_STANDARD_COMPUTED_DEFAULT)
      message(FATAL_ERROR "CMAKE_C_STANDARD_COMPUTED_DEFAULT should be set for ${CMAKE_C_COMPILER_ID} (${CMAKE_C_COMPILER}) version ${CMAKE_C_COMPILER_VERSION}")
    endif()
    set(CMAKE_C_STANDARD_DEFAULT ${CMAKE_C_STANDARD_COMPUTED_DEFAULT})
  elseif(NOT DEFINED CMAKE_C_STANDARD_DEFAULT)
    # Compiler id was forced so just guess the default standard level.
    if (NOT CMAKE_C_COMPILER_VERSION VERSION_LESS 3.6)
      set(CMAKE_C_STANDARD_DEFAULT 11)
    else()
      set(CMAKE_C_STANDARD_DEFAULT 99)
    endif()
  endif()
endif()

macro(cmake_record_c_compile_features)
  set(_result 0)
  if (UNIX AND NOT CMAKE_C_COMPILER_VERSION VERSION_LESS 3.4)
    _record_compiler_features_c(11)
    if (_result EQUAL 0)
      _record_compiler_features_c(99)
    endif()
    if (_result EQUAL 0)
      _record_compiler_features_c(90)
    endif()
  endif()
endmacro()
