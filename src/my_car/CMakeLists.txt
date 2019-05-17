cmake_minimum_required(VERSION 2.8.3)
project(my_car)

## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  tf
  std_msgs
  message_generation
  nav_msgs
  rosbag
  message_filters
  dynamic_reconfigure
)

## Generate messages in the 'msg' folder
add_message_files(
  FILES
  Odom.msg
  floatStamped.msg
)


## Generate added messages and services with any dependencies listed here
generate_messages(
  DEPENDENCIES
  std_msgs
  nav_msgs
)

generate_dynamic_reconfigure_options(
  cfg/parameters.cfg
  
)


catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES my_car
   CATKIN_DEPENDS roscpp rospy tf message_runtime message_filters
#  DEPENDS system_lib
)


include_directories(
# include
  ${catkin_INCLUDE_DIRS}
)

add_executable(car_listener src/car_listener.cpp)
target_link_libraries(car_listener ${catkin_LIBRARIES})


