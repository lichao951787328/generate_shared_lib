# compute paths
set(FOOTSTEPPLANNER_INCLUDE_DIRS    "/usr/local/include")  
set(FOOTSTEPPLANNER_LINK_DIRS       "/usr/local/lib"   )

# include paths
include_directories(${FOOTSTEPPLANNER_INCLUDE_DIRS})
link_directories(${FOOTSTEPPLANNER_LINK_DIRS})
message("--[FootstepPlannerLJH]: Package found! Include ${FOOTSTEPPLANNER_INCLUDE_DIRS} and ${FOOTSTEPPLANNER_LINK_DIRS}" )
