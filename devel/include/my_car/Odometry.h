// Generated by gencpp from file my_car/Odometry.msg
// DO NOT EDIT!


#ifndef MY_CAR_MESSAGE_ODOMETRY_H
#define MY_CAR_MESSAGE_ODOMETRY_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace my_car
{
template <class ContainerAllocator>
struct Odometry_
{
  typedef Odometry_<ContainerAllocator> Type;

  Odometry_()
    : num(0)  {
    }
  Odometry_(const ContainerAllocator& _alloc)
    : num(0)  {
  (void)_alloc;
    }



   typedef int64_t _num_type;
  _num_type num;





  typedef boost::shared_ptr< ::my_car::Odometry_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::my_car::Odometry_<ContainerAllocator> const> ConstPtr;

}; // struct Odometry_

typedef ::my_car::Odometry_<std::allocator<void> > Odometry;

typedef boost::shared_ptr< ::my_car::Odometry > OdometryPtr;
typedef boost::shared_ptr< ::my_car::Odometry const> OdometryConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::my_car::Odometry_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::my_car::Odometry_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace my_car

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'my_car': ['/home/emanuel/catkin_ws/src/my_car/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::my_car::Odometry_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::my_car::Odometry_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::my_car::Odometry_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::my_car::Odometry_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::my_car::Odometry_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::my_car::Odometry_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::my_car::Odometry_<ContainerAllocator> >
{
  static const char* value()
  {
    return "57d3c40ec3ac3754af76a83e6e73127a";
  }

  static const char* value(const ::my_car::Odometry_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x57d3c40ec3ac3754ULL;
  static const uint64_t static_value2 = 0xaf76a83e6e73127aULL;
};

template<class ContainerAllocator>
struct DataType< ::my_car::Odometry_<ContainerAllocator> >
{
  static const char* value()
  {
    return "my_car/Odometry";
  }

  static const char* value(const ::my_car::Odometry_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::my_car::Odometry_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int64 num\n\
";
  }

  static const char* value(const ::my_car::Odometry_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::my_car::Odometry_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.num);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Odometry_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::my_car::Odometry_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::my_car::Odometry_<ContainerAllocator>& v)
  {
    s << indent << "num: ";
    Printer<int64_t>::stream(s, indent + "  ", v.num);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MY_CAR_MESSAGE_ODOMETRY_H
