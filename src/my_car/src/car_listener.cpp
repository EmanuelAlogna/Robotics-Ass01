#include "ros/ros.h"
#include "std_msgs/String.h"
#include <tf/transform_broadcaster.h>
#include <nav_msgs/Odometry.h>
#include <sstream>
#include "my_car/Odom.h"
#include "my_car/floatStamped.h"
#include <std_msgs/Float64.h>
#include <std_msgs/Bool.h>
//#include "my_car/Odometry1.h"

#include <rosbag/bag.h>
#include <rosbag/view.h>
#include <std_msgs/Int32.h>
#include <message_filters/subscriber.h>
#include <message_filters/time_synchronizer.h>
#include <message_filters/sync_policies/exact_time.h>
#include <message_filters/sync_policies/approximate_time.h>

#include <dynamic_reconfigure/server.h>
#include <my_car/parametersConfig.h>

#include <boost/foreach.hpp>
#define foreach BOOST_FOREACH

using namespace message_filters;

int count = 1;

float speed_L;
float speed_R;
float th;
int steering_factor;
double distance_front_rear;
double rear_wheels_baseline;

/*void chatterCallback(const my_car::floatStamped::ConstPtr& msg){

  		ROS_INFO("I heard: [%f]", msg->data);
  		ROS_INFO("I heard: [%i]", msg->header.seq);
  		ROS_INFO("I heard: [%i]", count);	
  		ros::Rate r(1.0);
  		++count;
  		r.sleep();
}*/

/*void chatterCallback(const my_car::floatStamped::ConstPtr& msg){
	ROS_INFO("I'm here");
}*/

float x_init;
float y_init;
float theta;
int odometry_model;
int i = 0;

float vx = 100;  // just random values for now.
float vy = 100;
float vth = 100;

void compute_ackerman(){
}

void compute_differential_drive_kinematics(){
}


void dynamic_reconfigure_callback(my_car::parametersConfig &config, uint32_t level) {

	if (i == 0){
		ROS_INFO("Starting point - x coordinate: [%0.1f]", config.x_init);
		ROS_INFO("Starting point - y coordinate: [%0.1f]", config.y_init);
		ROS_INFO("Starting point - theta: [%0.1f]", config.theta);
		if (config.odometry == 1)
			ROS_INFO("Odometry computed through Ackerman");
		else 
			ROS_INFO("Odometry computed through Diff. Drive Kinematics");
		x_init = config.x_init;
		y_init = config.y_init;
		theta = config.theta;
		odometry_model = config.odometry;
		
		// the default set in the parameters.cfg is (0,0) for (x,y). 0 for theta
		// and 1 for the odometry value that means Ackerman is set.
		
		++i;
	}
	
	// LET'S CHECK IF ODOMETRY MODE IS CHANGED OR IF THE STARTING POINT IS RESET
	
	if (x_init != config.x_init){
		x_init = config.x_init;  // i change globabl var value that used for the odom.
		ROS_INFO("Starting point - x coord changed to: [%0.1f]", config.x_init);
	}
		
	if (y_init != config.y_init){
		y_init = config.y_init;
		ROS_INFO("Starting point - y coord changed to: [%0.1f]", config.y_init);
	}
	
	if (theta != config.theta){
		theta = config.theta;
		ROS_INFO("Starting point - th coord changed to: [%0.1f]", config.theta);
	}
	
	if (odometry_model != config.odometry){
		odometry_model = config.odometry;
		if (config.odometry == 1)
			ROS_INFO("Odometry now is computed using Ackerman");
		else 
			ROS_INFO("Odometry now is computed using Diff. Drive Kinematics");
	}
	
	
	//ROS_INFO("config.y_init: [%0.1f]", config.y_init);
	//ROS_INFO("y_init: [%0.1f]", y_init);
  	
}	
bool inside = false;

void callback(ros::NodeHandle &n, const my_car::floatStamped::ConstPtr& speed_wheel_L, const my_car::floatStamped::ConstPtr& speed_wheel_R, const my_car::floatStamped::ConstPtr& steer)
{
	//ROS_INFO("I heard: [%0.2f]", steer->data);
   	inside = true;
	th = (steer->data)/steering_factor;
    speed_L = speed_wheel_L->data;
    speed_R = speed_wheel_R->data;
    
    vx = speed_L;
    vy = speed_R;
    vth = th;  // ?? not sure about this
    
    
    //ROS_INFO("Angle theta: [%0.2f]", th);
    //ROS_INFO("Speed left wheel: [%0.2f]", speed_L);
    //ROS_INFO("Speed right wheel: [%0.2f]\n", speed_R);
  
  	// we have 1285 tuples of speedL, speedR, theta. 13013
  
 	// DYNAMIC RECONFIGURE
    
    dynamic_reconfigure::Server<my_car::parametersConfig> server;
    dynamic_reconfigure::Server<my_car::parametersConfig>::CallbackType f;
    f = boost::bind(&dynamic_reconfigure_callback, _1, _2);
  	server.setCallback(f);
  	
    // BELOW THIS POINT I COMPUTE ACKERMAN ODOMETRY AND DDK ODOMETRY
   
    // I need all the parameters set previously
   
    if (odometry_model == 1){
		compute_ackerman();
	}
    else{
   		compute_differential_drive_kinematics();
    }
   
    // PRINT ONE MORE TIME DATA WE NEED: X,Y,THETA, VX, VY, VTHETA
 	
 	
 	/*
 	ROS_INFO("x: [%0.1f]", x_init);
	ROS_INFO("y: [%0.1f]", y_init);
	ROS_INFO("th: [%0.1f]", theta);
 	ROS_INFO("vx: [%0.1f]", vx);
	ROS_INFO("vy: [%0.1f]", vy);
	ROS_INFO("vth: [%0.1f]\n", vth);
	*/
	
	// NOW I CAN PUBLISH EVERYTHING IN THE ODOM TOPIC
	// see main code block
   
}

void poseCallback(const nav_msgs::Odometry::ConstPtr& msg){
  static tf::TransformBroadcaster br;
  tf::Transform transform;
  transform.setOrigin( tf::Vector3(0,0, 0.0) ); // I set the origin to 0.0
  tf::Quaternion q;
  q.setRPY(0, 0, 0);
  transform.setRotation(q);
  br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "world", "odom"));
}

int main(int argc, char **argv){

    // "odometry publisher is the name of the client!"
	ros::init(argc, argv, "odometry_publisher");
	ros::NodeHandle n;
	
	//ros::Rate r(1.0);
	
	ros::Time current_time, last_time;
  	current_time = ros::Time::now();
  	last_time = ros::Time::now();
  	
  	
	ros::Publisher odom_pub = n.advertise<nav_msgs::Odometry>("odom", 50);
 	tf::TransformBroadcaster odom_broadcaster;
 	
 	ros::Subscriber sub = n.subscribe("odom", 10, &poseCallback);
	
	// GET PARAMETERS 
	
	n.getParam("/steering_factor", steering_factor);
	n.getParam("/distance_front_rear", distance_front_rear);
	n.getParam("/rear_wheels_baseline", rear_wheels_baseline);
	
	ROS_INFO("Steering factor is: [%i]", steering_factor);
	ROS_INFO("Rear wheels baseline is: [%0.1f]", rear_wheels_baseline);
	ROS_INFO("Distance front-rear is: [%0.1f]", distance_front_rear);
	
  	
	// MESSAGE FILTERS (to be able to listen to multiple topics) 

  	message_filters::Subscriber<my_car::floatStamped> speedL(n, "speedL_stamped", 1);
  	message_filters::Subscriber<my_car::floatStamped> speedR(n, "speedR_stamped", 1);
  	message_filters::Subscriber<my_car::floatStamped> steers(n, "steer_stamped", 1);
  	
  	typedef message_filters::sync_policies::ApproximateTime<my_car::floatStamped, my_car::floatStamped, my_car::floatStamped> MySyncPolicy;
  
   	message_filters::Synchronizer<MySyncPolicy> sync(MySyncPolicy(10), speedL, speedR, steers);
  	sync.registerCallback(boost::bind(&callback, boost::ref(n), _1, _2, _3));
 
 	ros::Rate r(200);
 	
 	while (ros::ok()){
 		if (inside){  // so if the bag has started playing
			
			ROS_INFO("Speed left wheel: [%0.2f]", vx);
			ROS_INFO("Speed left wheel: [%0.2f]", vy);
			ROS_INFO("Speed left wheel: [%0.2f]\n", vth);
			
			// SO APPARENTLY THETA IS NOT USED
			
			//since all odometry is 6DOF we'll need a quaternion created from yaw
			geometry_msgs::Quaternion odom_quat = tf::createQuaternionMsgFromYaw(theta);

			//first, we'll publish the transform over tf
			geometry_msgs::TransformStamped odom_trans;
			odom_trans.header.stamp = current_time;
			odom_trans.header.frame_id = "odom";
			odom_trans.child_frame_id = "my_car";

			odom_trans.transform.translation.x = x_init;
			odom_trans.transform.translation.y = y_init;
			odom_trans.transform.translation.z = 0.0;
			odom_trans.transform.rotation = odom_quat;

			//send the transform
			odom_broadcaster.sendTransform(odom_trans);

			//next, we'll publish the odometry message over ROS
			nav_msgs::Odometry odom;
			odom.header.stamp = current_time;
			odom.header.frame_id = "odom";

			//set the position
			odom.pose.pose.position.x = x_init;
			odom.pose.pose.position.y = y_init;
			odom.pose.pose.position.z = 0.0;
			odom.pose.pose.orientation = odom_quat;

			//set the velocity
			odom.child_frame_id = "my_car";
			odom.twist.twist.linear.x = vx;
			odom.twist.twist.linear.y = vy;
			odom.twist.twist.angular.z = vth;

			//publish the message
			odom_pub.publish(odom);

			last_time = current_time;
		}
		ros::spinOnce();
		r.sleep();
	}

 
 	ros::spin();
 
  	return 0;
}
