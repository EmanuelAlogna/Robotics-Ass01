;; Auto-generated. Do not edit!


(when (boundp 'my_car::Odom)
  (if (not (find-package "MY_CAR"))
    (make-package "MY_CAR"))
  (shadow 'Odom (find-package "MY_CAR")))
(unless (find-package "MY_CAR::ODOM")
  (make-package "MY_CAR::ODOM"))

(in-package "ROS")
;;//! \htmlinclude Odom.msg.html


(defclass my_car::Odom
  :super ros::object
  :slots (_x _y _th _source ))

(defmethod my_car::Odom
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:th __th) 0.0)
    ((:source __source) "")
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _th (float __th))
   (setq _source (string __source))
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
  (:source
   (&optional __source)
   (if __source (setq _source __source)) _source)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _th
    4
    ;; string _source
    4 (length _source)
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
     ;; string _source
       (write-long (length _source) s) (princ _source s)
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
   ;; string _source
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _source (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get my_car::Odom :md5sum-) "d4a1647b76578281a31b559937b51e08")
(setf (get my_car::Odom :datatype-) "my_car/Odom")
(setf (get my_car::Odom :definition-)
      "float32 x
float32 y
float32 th
string source

")



(provide :my_car/Odom "d4a1647b76578281a31b559937b51e08")


