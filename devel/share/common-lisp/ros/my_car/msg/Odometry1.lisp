; Auto-generated. Do not edit!


(cl:in-package my_car-msg)


;//! \htmlinclude Odometry1.msg.html

(cl:defclass <Odometry1> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (th
    :reader th
    :initarg :th
    :type cl:float
    :initform 0.0))
)

(cl:defclass Odometry1 (<Odometry1>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Odometry1>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Odometry1)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name my_car-msg:<Odometry1> is deprecated: use my_car-msg:Odometry1 instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <Odometry1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_car-msg:x-val is deprecated.  Use my_car-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <Odometry1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_car-msg:y-val is deprecated.  Use my_car-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'th-val :lambda-list '(m))
(cl:defmethod th-val ((m <Odometry1>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_car-msg:th-val is deprecated.  Use my_car-msg:th instead.")
  (th m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Odometry1>) ostream)
  "Serializes a message object of type '<Odometry1>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'th))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Odometry1>) istream)
  "Deserializes a message object of type '<Odometry1>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'th) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Odometry1>)))
  "Returns string type for a message object of type '<Odometry1>"
  "my_car/Odometry1")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Odometry1)))
  "Returns string type for a message object of type 'Odometry1"
  "my_car/Odometry1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Odometry1>)))
  "Returns md5sum for a message object of type '<Odometry1>"
  "32b6af7438d7bcbef150594ddfd57022")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Odometry1)))
  "Returns md5sum for a message object of type 'Odometry1"
  "32b6af7438d7bcbef150594ddfd57022")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Odometry1>)))
  "Returns full string definition for message of type '<Odometry1>"
  (cl:format cl:nil "float32 x~%float32 y~%float32 th~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Odometry1)))
  "Returns full string definition for message of type 'Odometry1"
  (cl:format cl:nil "float32 x~%float32 y~%float32 th~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Odometry1>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Odometry1>))
  "Converts a ROS message object to a list"
  (cl:list 'Odometry1
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':th (th msg))
))
