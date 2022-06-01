cmake_minimum_required(VERSION 3.0)

project(FootstepPlanner VERSION 1.0.0 DESCRIPTION "foot step planer")

set(CMAKE_BUILD_TYPE release)

find_package(Python3 COMPONENTS Interpreter Development REQUIRED)
find_package(Python3 COMPONENTS NumPy)
find_package(PythonLibs REQUIRED)

include_directories(
  include/
  ${PYTHON_INCLUDE_DIRS}
)

aux_source_directory(./src/Heuclid/euclid SRC_FILES)
aux_source_directory(./src/Heuclid/euclid/orientation SRC_FILES)
aux_source_directory(./src/Heuclid/euclid/tools SRC_FILES)
aux_source_directory(./src/Heuclid/euclid/tuple2D SRC_FILES)
aux_source_directory(./src/Heuclid/euclid/tuple3D SRC_FILES)
aux_source_directory(./src/Heuclid/euclid/tuple4D SRC_FILES)
aux_source_directory(./src/Heuclid/geometry/tools SRC_FILES)
aux_source_directory(./src/Heuclid/geometry SRC_FILES)

aux_source_directory(src/FootstepPlannerLJH SRC_FILES)
aux_source_directory(src/FootstepPlannerLJH/StepExpansion SRC_FILES)
aux_source_directory(src/FootstepPlannerLJH/StepCost SRC_FILES)
aux_source_directory(src/FootstepPlannerLJH/StepCheck SRC_FILES)
aux_source_directory(src/FootstepPlannerLJH/PlotCheck SRC_FILES)
aux_source_directory(src/FootstepPlannerLJH/StepConstraints SRC_FILES)

# add_executable(test test.cpp ${SRC_FILES})

add_library(${PROJECT_NAME} SHARED ${SRC_FILES})

target_link_libraries(${PROJECT_NAME}  ${PYTHON_LIBRARIES})

message("Install path is ${CMAKE_INSTALL_PREFIX}")

set(${PROJECT_NAME}_include_dirs ${CMAKE_INSTALL_PREFIX}/include)
set(${PROJECT_NAME}_link_dirs ${CMAKE_INSTALL_PREFIX}/lib)

configure_file(${PROJECT_NAME}.cmake.in ${PROJECT_NAME}Config.cmake @ONLY)

install(FILES ${PROJECT_BINARY_DIR}/${PROJECT_NAME}Config.cmake DESTINATION share/${PROJECT_NAME}/cmake)

install(FILES ${PROJECT_BINARY_DIR}/libFootstepPlanner.so DESTINATION lib)
install(DIRECTORY include/Heuclid include/FootstepPlannerLJH DESTINATION include)
# # Configure the directories to search for header files.
# target_include_directories(${PROJECT_NAME} PRIVATE include)
# # Set the version property.
# set_target_properties(${PROJECT_NAME} PROPERTIES VERSION ${PROJECT_VERSION})
# # Set the shared object version property to the project's major version.
# set_target_properties(${PROJECT_NAME} PROPERTIES SOVERSION ${PROJECT_VERSION_MAJOR})
# Set the public header property to the one with the actual API.

# macro(FIND_INCLUDE_DIR result curdir)  
#     file(GLOB_RECURSE children "${curdir}/*.hpp" "${curdir}/*.h" )
#     message(STATUS "children= ${children}")								
#     set(dirlist "")														
#     foreach(child ${children})										
#         string(REGEX REPLACE "(.*)/.*" "\\1" LIB_NAME ${child})			
#         if(IS_DIRECTORY ${LIB_NAME})									
#             LIST(APPEND dirlist ${LIB_NAME})							
#         endif()															
#     endforeach()														
#     set(${result} ${dirlist})											
# endmacro()	
# FIND_INCLUDE_DIR(INCLUDE_DIR_LIST include)
# set_target_properties(${PROJECT_NAME} PROPERTIES PUBLIC_HEADER ${INCLUDE_DIR_LIST})
# include(GNUInstallDirs)
# install(TARGETS ${PROJECT_NAME} LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
# install(PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
# For access to standard installation directory variables (CMAKE_INSTALL_xDIR).
# 

# Set library shared object and API header file to install.
# install(TARGETS ${PROJECT_NAME}
#     LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
#     PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
# )