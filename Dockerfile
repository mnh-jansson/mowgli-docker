FROM ghcr.io/clemenselflein/open_mower_ros:main as base

# patch custom launch file that launches rosserial and including original launch file 
COPY --link ./launch/mowgli.launch /opt/open_mower_ros/src/open_mower/launch/mowgli.launch

# install rosserial fork that contains services
FROM base as rosserial

ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir -p /opt/rosserial/src && cd /opt/rosserial/src && git clone https://github.com/tongtybj/rosserial && cd rosserial && git checkout rosservice_server
RUN bash -c "source /opt/ros/$ROS_DISTRO/setup.bash && cd /opt/rosserial && catkin_make -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic install --only-pkg-with-deps rosserial_server"

CMD ["bash", "-c", "service nginx start; service mosquitto start; roslaunch /opt/open_mower_ros/src/open_mower/launch/mowgli.launch --screen"]
