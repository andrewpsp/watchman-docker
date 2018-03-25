FROM ubuntu

LABEL vendor=facebook \
      docker-watchman.Project=docker-watchman-1.0 \
      docker-watchman.client="watchman" \  
      docker-watchman.version="0.0.1" \
      Hello-Api.release-date="2018-24-3"

ARG WATCHMAN_VERSION=4.9.0

RUN apt-get update -y -qq && \ 
apt-get install -y -qq curl git-core

RUN apt-get install -y libssl-dev \
 pkg-config \
libtool \
curl \
ca-certificates \
build-essential \
autoconf \
python-dev \
libpython-dev \
autotools-dev \
automake && \
git clone https://github.com/facebook/watchman.git && \ 
cd watchman && \
git checkout v${WATCHMAN_VERSION} && \
./autogen.sh && \
./configure && \
make && \
make install && \
apt-get purge -y pkg-config curl ca-certificates git-core build-essential autoconf python-dev libpython-dev autotools-dev automake libtool && \ 
cd /tmp && rm -rf watchman


