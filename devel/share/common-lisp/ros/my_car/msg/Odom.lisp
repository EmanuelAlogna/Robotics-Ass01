; Auto-generated. Do not edit!


(cl:in-package my_car-msg)


;//! \htmlinclude Odom.msg.html

(cl:defclass <Odom> (roslisp-msg-protocol:ros-message)
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
    :initform 0.0)
   (source
    :reader source
    :initarg :source
    :type cl:string
    :initform ""))
)

(cl:defclass Odom (<Odom>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Odom>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Odom)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name my_car-msg:<Odom> is deprecated: use my_car-msg:Odom instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <Odom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_car-msg:x-val is deprecated.  Use my_car-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <Odom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_car-msg:y-val is deprecated.  Use my_car-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'th-val :lambda-list '(m))
(cl:defmethod th-val ((m <Odom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_car-msg:th-val is deprecated.  Use my_car-msg:th instead.")
  (th m))

(cl:ensure-generic-function 'source-val :lambda-list '(m))
(cl:defmethod source-val ((m <Odom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_car-msg:source-val is deprecated.  Use my_car-msg:source instead.")
  (source m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Odom>) ostream)
  "Serializes a message object of type '<Odom>"
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
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'source))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'source))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Odom>) istream)
  "Deserializes a message object of type '<Odom>"
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
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'source) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'source) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Odom>)))
  "Returns string type for a message object of type '<Odom>"
  "my_car/Odom")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Odom)))
  "Returns string type for a message object of type 'Odom"
  "my_car/Odom")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Odom>)))
  "Returns md5sum for a message object of type '<Odom>"
  "d4a1647b76578281a31b559937b51e08")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Odom)))
  "Returns md5sum for a message object of type 'Odom"
  "d4a1647b76578281a31b559937b51e08")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Odom>)))
  "Returns full string definition for message of type '<Odom>"
  (cl:format cl:nil "float32 x~%float32 y~%float32 th~%string source~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Odom)))
  "Returns full string definition for message of type 'Odom"
  (cl:format cl:nil "float32 x~%float32 y~%float32 th~%string source~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Odom>))
  (cl:+ 0
     4
     4
     4
     4 (cl:length (cl:slot-value msg 'source))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Odom>))
  "Converts a ROS message object to a list"
  (cl:list 'Odom
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':th (th msg))
    (cl:cons ':source (source msg))
))
