# Check if ROS2 already installed
if (dpkg -s ros-dashing-desktop); then
    echo "ROS2 already installed, nothing to be done"
    exit 0
fi

# Setup Locale
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

# Installing dependencies 
sudo apt update && sudo apt install curl gnupg2 lsb-release

# Fetching ROS2 distro for Ubuntu
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo sh -c 'echo "deb [arch=$(dpkg --print-architecture)] http://packages.ros.org/ros2/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list'

# Installing ROS2 dashing
sudo apt update
sudo apt install ros-dashing-desktop

# Set up environment
source /opt/ros/dashing/setup.bash