FROM nvidia/cuda:10.2-cudnn7-devel-ubuntu18.04

# TODO : install g20, pangolin 

ARG UNAME=light
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID -o $UNAME
RUN useradd -m -u $UID -g $GID -o -s /bin/bash $UNAME
USER $UNAME

ENV DEBIAN_FRONTEND=noninteractive
ENV OPENCV_VERSION=4.5.0

#Development tools

RUN apt-get update && apt-get install -y g++ rsync zip openssh-server make \
	cmake git wget  && rm -rf /var/lib/apt/lists/*


# networking tools

RUN apt-get update && apt-get install -y net-tools curl \
    && rm -rf /var/lib/apt/lists/*


# IDE
# TODO: add Jupyter Notebook

RUN apt-get update && apt-get install -y vim  && rm -rf /var/lib/apt/lists/*


# My utilities

RUN  apt-get update && apt-get upgrade -y &&\
    # Install build tools, build dependencies and python
    apt-get install -y \
	    python-pip \
        build-essential \
        unzip \
        yasm \
        pkg-config \
        libswscale-dev \
        libtbb2 \
        libtbb-dev \
        libjpeg-dev \
        libpng-dev \
        libtiff-dev \
        libavformat-dev \
        libpq-dev \
        libxine2-dev \
        libglew-dev \
        libtiff5-dev \
        zlib1g-dev \
        libjpeg-dev \
        libavcodec-dev \
        libavformat-dev \
        libavutil-dev \
        libpostproc-dev \
        libswscale-dev \
        libeigen3-dev \
        libtbb-dev \
        libgtk2.0-dev \
        pkg-config \
        python-dev \
        python-numpy \
        python3-dev \
        python3-numpy && \
      rm -rf /var/lib/apt/lists/*


RUN apt-get update && apt-get -y install libeigen3-dev \
  && rm -rf /var/lib/apt/lists/*



# ros2 layer

RUN locale  && apt-get update && \
	 apt-get install locales\ 
	 && locale-gen en_US en_US.UTF-8\
         &&  update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8\
         && export LANG=en_US.UTF-8 && locale \ 
         && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y curl gnupg2 lsb-release && \	
	curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add - &&\
	echo "deb [arch=$(dpkg --print-architecture)] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2-latest.list 


RUN apt-get update && apt-get -y install ros-eloquent-desktop	


# opencv layer
RUN cd /opt/ &&\
    # Download and unzip OpenCV and opencv_contrib and delte zip files
    wget https://github.com/opencv/opencv/archive/$OPENCV_VERSION.zip &&\
    unzip $OPENCV_VERSION.zip &&\
    rm $OPENCV_VERSION.zip &&\
    wget https://github.com/opencv/opencv_contrib/archive/$OPENCV_VERSION.zip &&\
    unzip ${OPENCV_VERSION}.zip &&\
    rm ${OPENCV_VERSION}.zip &&\
    mkdir /opt/opencv-${OPENCV_VERSION}/build && cd /opt/opencv-${OPENCV_VERSION}/build &&\
    cmake \
        -DOPENCV_EXTRA_MODULES_PATH=/opt/opencv_contrib-${OPENCV_VERSION}/modules \
        -DWITH_CUDA=ON \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_PREFIX=/usr/local \
        .. &&  make -j8 && make install && ldconfig &&\
    rm -rf /opt/opencv-${OPENCV_VERSION} && rm -rf /opt/opencv_contrib-${OPENCV_VERSION}


RUN apt-get update && pip install tensorflow


 
