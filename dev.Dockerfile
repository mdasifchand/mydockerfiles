FROM nvidia/cuda:10.2-cudnn7-devel-ubuntu18.04


ENV DEBIAN_FRONTEND=noninteractive


#Development tools

RUN apt-get update && apt-get install -y g++ rsync zip openssh-server make \
	cmake build-essential  


# networking tools

RUN apt-get update && apt-get install -y net-tools curl


# IDE

RUN apt-get update && apt-get install -y vim  


 
