locale  # check for UTF-8

sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

locale  # verify settings

# Enable Ubuntu Universe repository
sudo apt install software-properties-common -y
sudo add-apt-repository universe

sudo apt update && sudo apt install curl -y

# Add the ROS 2 GPG key with apt.
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

# Add the repository to the sources list
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null


sudo apt update && sudo apt upgrade -y

# Install Desktop version which includes ROS, RViz, demos, tutorials.
sudo apt install ros-foxy-desktop python3-argcomplete -y

# Install Compilers and other tools to build ROS packages
sudo apt install ros-dev-tools -y

# Add line to source /opt/ros/foxy/setup.bash everytime a new session opens
echo "source /opt/ros/foxy/setup.bash" >> $HOME/.bashrc




# install Gazebo-11, xacro and joint state publisher gui ros packages
sudo apt install ros-foxy-gazebo-ros-pkgs ros-foxy-xacro ros-foxy-joint-state-publisher-gui -y
