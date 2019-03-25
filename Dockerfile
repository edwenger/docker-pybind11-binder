FROM ubuntu:18.04
MAINTAINER Edward Wenger

RUN apt-get update && apt-get install -y build-essential \
    cmake \
    ninja-build \
    wget \
	curl \
    git \
    python3 python3-dev python3-pip \
    && pip3 install pytest \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV HOME /usr/local

# Get latest binder code from repository
RUN cd $HOME \
    && git clone https://github.com/RosettaCommons/binder.git

# Build binder
RUN cd $HOME/binder \
	&& python3 build.py -j8