FROM ghcr.io/clemenselflein/open_mower_ros:main

# install rosserial
RUN apt-get update && apt-get install --yes ros-${ROS_DISTRO}-rosserial

# patch custom launch file that launches rosserial and including original launch file 
COPY --link ./launch/mowgli.launch /opt/open_mower_ros/src/open_mower/launch/mowgli.launch

CMD ["bash", "-c", "service nginx start; service mosquitto start; roslaunch /opt/open_mower_ros/src/open_mower/launch/mowgli.launch --screen"]
