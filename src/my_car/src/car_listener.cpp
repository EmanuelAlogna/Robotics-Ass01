#include "ros/ros.h"
#include "std_msgs/String.h"
#include <tf/transform_broadcaster.h>
#include <nav_msgs/Odometry.h>
#include <sstream>
#include "my_car/Odom.h"
#include "my_car/floatStamped.h"
#include <std_msgs/Float64.h>
#include <std_msgs/Bool.h>
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
#define PI 3.14159265

float speed_L;
float speed_R;
float th;
int steering_factor;
double distance_front_rear;
double rear_wheels_baseline;
float x_init;
float y_init;
float theta = 0.0;
float alpha;
int odometry_model;
int i = 0;
float vx = 100;  // just random values for now.
float vy = 100;
float vth = 100;
ros::Time current_time;
ros::Time last_time;
double Ts = 0;
double last_time_R = 0;


// I want two variables to store the old values of x_config and y_config so
// that if values change through dynamic reconfigure I can notice that.
double dynamic_x_old;
double dynamic_y_old;
// let's store also old value of theta
double dynamic_theta_old;



void compute_ackerman(){

	// alpha = steer/steering_factor
	double v = (speed_R + speed_L)/2;
	double R = (distance_front_rear / tan((alpha*PI)/180));
	
	vth = v/R;
	//compute x, y, th, using Ts (also called dt)
	
	x_init = x_init + v * Ts * cos((alpha*PI)/180);
	y_init = y_init + v * Ts * sin((alpha*PI)/180);
	vth = (vth*180)/PI;
	th = th + vth*Ts;

	th = th + ((vth*180)/PI)*Ts;

	th = th + vth*Ts;
	if (th >= 360){
		th = th-360;
	}
	
	//ROS_INFO("v: [%f]", v);
	//ROS_INFO("vth: [%f]", vth);
	//ROS_INFO("alpha: [%f]", alpha);
	ROS_INFO("x': [%f]", x_init);
	ROS_INFO("y': [%f]", y_init);
	ROS_INFO("theta': [%f]\n", th);
}

void compute_differential_drive_kinematics(){
	
	double v = (speed_R + speed_L)/2;
	
	if (speed_R > speed_L)   // car is rotating w/ positive omega (regola mano dx)
		vth = (speed_R-speed_L)/rear_wheels_baseline;
	else if (speed_R < speed_L)
		vth = (speed_L-speed_R)/rear_wheels_baseline;
	else
		vth = 0; // vehicle is not rotating

	//compute x, y, th, using Ts (also called dt)
	//double theta_rad = th*PI)/180  //from degree to radiant -> th*(2*pi)/360
	
	x_init = x_init + v * Ts * cos((th*PI)/180);
	y_init = y_init + v * Ts * sin((th*PI)/180);
	th = th + ((vth*180)/PI)*Ts;
	
	th = th + vth*Ts;
	if (th >= 360){
		th = th-360;
	}

	//ROS_INFO("v: [%f]", v);
	//ROS_INFO("vth: [%f]", vth);
	ROS_INFO("x': [%f]", x_init);
	ROS_INFO("y': [%f]", y_init);
	ROS_INFO("theta': [%f]", th);
	
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
		dynamic_x_old = config.x_init;
		y_init = config.y_init;
		dynamic_y_old = config.y_init;
		theta = config.theta;
		dynamic_theta_old = config.theta;
		odometry_model = config.odometry;
		
		// the default set in the parameters.cfg is (0,0) for (x,y). 0 for theta
		// and 1 for the odometry value that means Ackerman is set.
		
		++i;
	}
	
	// LET'S CHECK IF ODOMETRY MODE IS CHANGED OR IF THE STARTING POINT IS RESET
	// check if value changed
	if (dynamic_x_old != config.x_init){
		x_init = config.x_init;
		dynamic_x_old = config.x_init;
		ROS_INFO("Starting point - x coord changed to: [%0.1f]", config.x_init);
	}
		
	if (dynamic_y_old != config.y_init){
		y_init = config.y_init;         // I change the value of the y coordinate
		dynamic_y_old = config.y_init;  // I store the value that I'll use later
		ROS_INFO("Starting point - y coord changed to: [%0.1f]", config.y_init);
	}
	
	if (dynamic_theta_old != config.theta){
		theta = config.theta;
		dynamic_theta_old = config.theta;
		ROS_INFO("Starting point - th coord changed to: [%0.1f]", config.theta);
	}
	
	if (odometry_model != config.odometry){
		odometry_model = config.odometry;
		if (config.odometry == 1)
			ROS_INFO("Odometry now is computed using Ackerman");
		else 
			ROS_INFO("Odometry now is computed using Diff. Drive Kinematics");
	}
	 	
}	
bool inside = false;

void callback(ros::NodeHandle &n, const my_car::floatStamped::ConstPtr& speed_wheel_L, const my_car::floatStamped::ConstPtr& speed_wheel_R, const my_car::floatStamped::ConstPtr& steer)
{
	//ROS_INFO("I heard: [%0.2f]", steer->data);
	if (!inside){
		last_time_R = speed_wheel_R->header.stamp.toSec();  // initializing last_time_R
		// first time, there will be Ts = 0
	}
   	inside = true;
	alpha = (steer->data)/steering_factor;
    speed_L = speed_wheel_L->data;
    speed_R = speed_wheel_R->data;
    
    vx = speed_L;
    vy = speed_R;
    vth = alpha;  // ?? not sure about this
    
    
    double timestamp_R = speed_wheel_R->header.stamp.toSec();
    
    Ts = timestamp_R - last_time_R;
    
    // DYNAMIC RECONFIGURE
    
    dynamic_reconfigure::Server<my_car::parametersConfig> server;
    dynamic_reconfigure::Server<my_car::parametersConfig>::CallbackType f;
    f = boost::bind(&dynamic_reconfigure_callback, _1, _2);
  	server.setCallback(f);
  	
    // BELOW THIS POINT I COMPUTE ACKERMAN ODOMETRY AND DDK ODOMETRY
   
    // I need all the parameters set previously
   
    if (odometry_model == 1){
		compute_differential_drive_kinematics();
		ROS_INFO("Ackerman:");
	}
    else{
   		compute_differential_drive_kinematics();
		ROS_INFO("Differential drive");
    }
   
    last_time_R = timestamp_R;
   
}

int main(int argc, char **argv){

    ros::init(argc, argv, "odometry_publisher");
	ros::NodeHandle n;
	
  	current_time = ros::Time::now();
  	last_time = ros::Time::now();
  	
  	
	ros::Publisher odom_pub = n.advertise<nav_msgs::Odometry>("world", 50);
 	tf::TransformBroadcaster odom_broadcaster;
 	
 	ros::Publisher chatter_pub = n.advertise<my_car::Odom>("publisher", 1000);
 	
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
			
			//since all odometry is 6DOF we'll need a quaternion created from yaw
			geometry_msgs::Quaternion odom_quat = tf::createQuaternionMsgFromYaw(theta);

			//first, we'll publish the transform over tf
			geometry_msgs::TransformStamped odom_trans;
			odom_trans.header.stamp = current_time;
			odom_trans.header.frame_id = "world";
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
			odom.header.frame_id = "world";

			//set the position
			odom.pose.pose.position.x = x_init;
			odom.pose.pose.position.y = y_init;
			odom.pose.pose.position.z = 0.0;
			odom.pose.pose.orientation = odom_quat;

			//set the velocity
			odom.child_frame_id = "my_car";
			odom.twist.twist.linear.x = vx;
			odom.twist.twist.linear.y = vy;
			odom.twist.twist.angular.z = vth; // vth is alpha

			//publish the message
			odom_pub.publish(odom);

			my_car::Odom msg;
			msg.x = x_init;
			msg.y = y_init;
			msg.th = th;
			msg.source = odometry_model;
			
			if (odometry_model == 1){
				msg.source = "Ackerman";
			}
    		else{
   				msg.source = "Differential drive";
    		}

			// PUBLISH A CUSTOME MESSAGE W/ ODOMETRY VALUE (X,Y,TH) AND TYPE OF SOURCE
			chatter_pub.publish(msg);

			last_time = current_time;
		}
		ros::spinOnce();
		r.sleep();
	}

 
 	ros::spin();
 
  	return 0;
}
