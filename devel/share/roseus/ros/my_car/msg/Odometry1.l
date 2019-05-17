;; Auto-generated. Do not edit!


(when (boundp 'my_car::Odometry1)
  (if (not (find-package "MY_CAR"))
    (make-package "MY_CAR"))
  (shadow 'Odometry1 (find-package "MY_CAR")))
(unless (find-package "MY_CAR::ODOMETRY1")
  (make-package "MY_CAR::ODOMETRY1"))

(in-package "ROS")
;;//! \htmlinclude Odometry1.msg.html


(defclass my_car::Odometry1
  :super ros::object
  :slots (_x _y _th ))

(defmethod my_car::Odometry1
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:th __th) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _th (float __th))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:th
   (&optional __th)
   (if __th (setq _th __th)) _th)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _th
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _th
       (sys::poke _th (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _th
     (setq _th (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get my_car::Odometry1 :md5sum-) "32b6af7438d7bcbef150594ddfd57022")
(setf (get my_car::Odometry1 :datatype-) "my_car/Odometry1")
(setf (get my_car::Odometry1 :definition-)
      "float32 x
float32 y
float32 th

")



(provide :my_car/Odometry1 "32b6af7438d7bcbef150594ddfd57022")


