cmake_minimum_required(VERSION 3.0)

project(test)

set(CMAKE_BUILD_TYPE release)


find_package(FootstepPlanner REQUIRED)
find_package(Python3 COMPONENTS Interpreter Development REQUIRED)
find_package(Python3 COMPONENTS NumPy)
find_package(PythonLibs REQUIRED)
if(${FootstepPlanner_FOUND})
  message("has found lib FootstepPlanner")
else()
  message("not found lib")
endif()
link_libraries(FootstepPlanner)
include_directories( ${PYTHON_INCLUDE_DIRS})
add_executable(test test.cpp )
target_link_libraries(test ${PYTHON_LIBRARIES})

