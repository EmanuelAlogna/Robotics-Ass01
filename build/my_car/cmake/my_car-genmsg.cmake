# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "my_car: 2 messages, 0 services")

set(MSG_I_FLAGS "-Imy_car:/home/emanuel/catkin_ws/src/my_car/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Inav_msgs:/opt/ros/kinetic/share/nav_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(my_car_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/emanuel/catkin_ws/src/my_car/msg/floatStamped.msg" NAME_WE)
add_custom_target(_my_car_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "my_car" "/home/emanuel/catkin_ws/src/my_car/msg/floatStamped.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/emanuel/catkin_ws/src/my_car/msg/Odom.msg" NAME_WE)
add_custom_target(_my_car_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "my_car" "/home/emanuel/catkin_ws/src/my_car/msg/Odom.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(my_car
  "/home/emanuel/catkin_ws/src/my_car/msg/floatStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_car
)
_generate_msg_cpp(my_car
  "/home/emanuel/catkin_ws/src/my_car/msg/Odom.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_car
)

### Generating Services

### Generating Module File
_generate_module_cpp(my_car
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_car
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(my_car_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(my_car_generate_messages my_car_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/emanuel/catkin_ws/src/my_car/msg/floatStamped.msg" NAME_WE)
add_dependencies(my_car_generate_messages_cpp _my_car_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/emanuel/catkin_ws/src/my_car/msg/Odom.msg" NAME_WE)
add_dependencies(my_car_generate_messages_cpp _my_car_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(my_car_gencpp)
add_dependencies(my_car_gencpp my_car_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS my_car_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(my_car
  "/home/emanuel/catkin_ws/src/my_car/msg/floatStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_car
)
_generate_msg_eus(my_car
  "/home/emanuel/catkin_ws/src/my_car/msg/Odom.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_car
)

### Generating Services

### Generating Module File
_generate_module_eus(my_car
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_car
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(my_car_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(my_car_generate_messages my_car_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/emanuel/catkin_ws/src/my_car/msg/floatStamped.msg" NAME_WE)
add_dependencies(my_car_generate_messages_eus _my_car_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/emanuel/catkin_ws/src/my_car/msg/Odom.msg" NAME_WE)
add_dependencies(my_car_generate_messages_eus _my_car_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(my_car_geneus)
add_dependencies(my_car_geneus my_car_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS my_car_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(my_car
  "/home/emanuel/catkin_ws/src/my_car/msg/floatStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_car
)
_generate_msg_lisp(my_car
  "/home/emanuel/catkin_ws/src/my_car/msg/Odom.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_car
)

### Generating Services

### Generating Module File
_generate_module_lisp(my_car
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_car
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(my_car_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(my_car_generate_messages my_car_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/emanuel/catkin_ws/src/my_car/msg/floatStamped.msg" NAME_WE)
add_dependencies(my_car_generate_messages_lisp _my_car_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/emanuel/catkin_ws/src/my_car/msg/Odom.msg" NAME_WE)
add_dependencies(my_car_generate_messages_lisp _my_car_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(my_car_genlisp)
add_dependencies(my_car_genlisp my_car_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS my_car_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(my_car
  "/home/emanuel/catkin_ws/src/my_car/msg/floatStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_car
)
_generate_msg_nodejs(my_car
  "/home/emanuel/catkin_ws/src/my_car/msg/Odom.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_car
)

### Generating Services

### Generating Module File
_generate_module_nodejs(my_car
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_car
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(my_car_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(my_car_generate_messages my_car_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/emanuel/catkin_ws/src/my_car/msg/floatStamped.msg" NAME_WE)
add_dependencies(my_car_generate_messages_nodejs _my_car_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/emanuel/catkin_ws/src/my_car/msg/Odom.msg" NAME_WE)
add_dependencies(my_car_generate_messages_nodejs _my_car_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(my_car_gennodejs)
add_dependencies(my_car_gennodejs my_car_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS my_car_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(my_car
  "/home/emanuel/catkin_ws/src/my_car/msg/floatStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_car
)
_generate_msg_py(my_car
  "/home/emanuel/catkin_ws/src/my_car/msg/Odom.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_car
)

### Generating Services

### Generating Module File
_generate_module_py(my_car
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_car
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(my_car_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(my_car_generate_messages my_car_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/emanuel/catkin_ws/src/my_car/msg/floatStamped.msg" NAME_WE)
add_dependencies(my_car_generate_messages_py _my_car_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/emanuel/catkin_ws/src/my_car/msg/Odom.msg" NAME_WE)
add_dependencies(my_car_generate_messages_py _my_car_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(my_car_genpy)
add_dependencies(my_car_genpy my_car_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS my_car_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_car)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/my_car
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(my_car_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET nav_msgs_generate_messages_cpp)
  add_dependencies(my_car_generate_messages_cpp nav_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_car)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/my_car
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(my_car_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET nav_msgs_generate_messages_eus)
  add_dependencies(my_car_generate_messages_eus nav_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_car)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/my_car
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(my_car_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET nav_msgs_generate_messages_lisp)
  add_dependencies(my_car_generate_messages_lisp nav_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_car)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/my_car
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(my_car_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET nav_msgs_generate_messages_nodejs)
  add_dependencies(my_car_generate_messages_nodejs nav_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_car)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_car\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/my_car
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(my_car_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET nav_msgs_generate_messages_py)
  add_dependencies(my_car_generate_messages_py nav_msgs_generate_messages_py)
endif()
