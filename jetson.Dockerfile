FROM aarch64/ubuntu

ENV DEBIAN_FRONTEND=noninteractive

ENV UID=1000
ENV GID=1000
RUN groupadd -g $GID -o light
RUN useradd -m -u $UID -g $GID -o -s /bin/bash light
USER light



# base URL for NVIDIA libs
ENV URL=http://developer.download.nvidia.com/devzone/devcenter/mobile/jetpack_l4t/3.2/pwv346/JetPackL4T_32_b157



# Update packages, install some useful packages
RUN apt-get update && apt-get install -y apt-utils bzip2 curl sudo unp && apt-get clean && rm -rf /var/cache/apt
WORKDIR /tmp




# Instlal jetson tx2 drivers
RUN curl -sL http://developer.nvidia.com/embedded/dlc/l4t-jetson-tx2-driver-package-28-2 | tar xvfj - && \ 
    chown root /etc/passwd /etc/sudoers /usr/lib/sudo/sudoers.so /etc/sudoers.d/README && \
    /tmp/Linux_for_Tegra/apply_binaries.sh -r / && rm -fr /tmp/*





# pull important libcudnn deps
RUN curl $URL/cuda-repo-l4t-9-0-local_9.0.252-1_arm64.deb -so cuda-repo-l4t_arm64.deb && \ 
    curl $URL/libcudnn7_7.0.5.13-1+cuda9.0_arm64.deb -so /tmp/libcudnn_arm64.deb && \ 
    curl $URL/libcudnn7-dev_7.0.5.13-1+cuda9.0_arm64.deb -so /tmp/libcudnn-dev_arm64.deb





## Install libs: L4T, CUDA, cuDNN
RUN dpkg -i /tmp/cuda-repo-l4t_arm64.deb && \ 
    apt-key add /var/cuda-repo-9-0-local/7fa2af80.pub && \ 
    apt-get update && apt-get install -y cuda-toolkit-9.0 && \ 
    dpkg -i /tmp/libcudnn_arm64.deb && dpkg -i /tmp/libcudnn-dev_arm64.deb
    

ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/aarch64-linux-gnu/tegra



# create symlink
RUN ln -s /usr/lib/aarch64-linux-gnu/tegra/libnvidia-ptxjitcompiler.so.28.2.0 /usr/lib/aarch64-linux-gnu/tegra/libnvidia-ptxjitcompiler.so && \ 
    ln -s /usr/lib/aarch64-linux-gnu/tegra/libnvidia-ptxjitcompiler.so.28.2.0 /usr/lib/aarch64-linux-gnu/tegra/libnvidia-ptxjitcompiler.so.1 && \ 
    ln -sf /usr/lib/aarch64-linux-gnu/tegra/libGL.so /usr/lib/aarch64-linux-gnu/libGL.so 



RUN ln -s /usr/lib/aarch64-linux-gnu/libcuda.so /usr/lib/aarch64-linux-gnu/libcuda.so.1



RUN apt-get -y autoremove && apt-get -y autoclean
RUN rm -rf /var/cache/apt
