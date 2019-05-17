
(cl:in-package :asdf)

(defsystem "my_car-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Odom" :depends-on ("_package_Odom"))
    (:file "_package_Odom" :depends-on ("_package"))
    (:file "floatStamped" :depends-on ("_package_floatStamped"))
    (:file "_package_floatStamped" :depends-on ("_package"))
  ))