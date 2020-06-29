# Source the ROS 2 installation
source /opt/ros/$ROS_DISTRO/setup.bash

# Create a workspace and download the micro-ROS tools
mkdir ../microros_ws 
cd ../microros_ws
git clone --recursive -b $ROS_DISTRO https://github.com/micro-ROS/micro-ros-build.git src/micro-ros-build 

# Update dependencies using rosdep
sudo apt update && rosdep update
rosdep install --from-path src --ignore-src -y

# Build micro-ROS tools and source them
colcon build
source install/local_setup.bash