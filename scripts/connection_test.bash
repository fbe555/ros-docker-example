#!/usr/bin/env bash

ros_distro="rolling"
if [ -n "$1" ]; then
    ros_distro=$1
fi

source /opt/ros/$ros_distro/setup.bash
export ROS_DOMAIN_ID="42"
export ROS_AUTOMATIC_DISCOVERY_RANGE="SUBNET"

ros2 doctor hello