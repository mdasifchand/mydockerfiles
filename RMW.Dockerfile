FROM  osrf/ros2:nightly-rmw-nonfree
ENV DEBIAN_FRONTEND=noninteractive


RUN apt-get update \
 && apt-get install -y sudo

RUN adduser --disabled-password --gecos '' light
RUN adduser light sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER light

                       
