FROM ubuntu:14.04

ENV MAINTAINER=linshuai2012@gmail.com \
    UPDATEAT=20161123 \
    DEBIAN_FRONTEND=noninteractive

# install python
RUN apt-get update -qq && \
    apt-get install -qy git vim curl wget telnet netcat && \
    apt-get install -qy \
        netbase ca-certificates apt-transport-https \
        build-essential python python-dev \
        libxml2-dev libssl-dev libxslt1-dev \
        libmysqlclient-dev \
        libevent-dev \
        libffi-dev libssl-dev \
        libpcre3-dev libz-dev

# install pip/wheel
RUN curl -o /tmp/get-pip.py https://bootstrap.pypa.io/get-pip.py && \
    python /tmp/get-pip.py && \
    pip install --no-cache-dir -U wheel && \
    pip install --no-cache-dir requests[security]==2.10.0 && \

# python3
RUN apt-get update -qq && \
    apt-get install -y python3.4 python3.4-dev libpython3.4-dev && \
    cp -a /usr/local/bin/pip /tmp/pip2 && \
    curl -s -o /tmp/get-pip.py https://bootstrap.pypa.io/get-pip.py && \
    python3 /tmp/get-pip.py && \
    cp -a /usr/local/bin/pip /usr/local/bin/pip3 && \
    cp -a /tmp/pip2 /usr/local/bin/pip && \
    cp -a /tmp/pip2 /usr/local/bin/pip2 && \

# Clean up for docker squash
# See https://github.com/goldmann/docker-squash
RUN rm -rf \
    /root/.cache \
    /root/.npm \
    /root/.pip \
    /usr/local/share/doc \
    /usr/share/doc \
    /usr/share/man \
    /usr/share/vim/vim74/doc \
    /usr/share/vim/vim74/lang \
    /usr/share/vim/vim74/spell/en* \
    /usr/share/vim/vim74/tutor \
    /var/lib/apt/lists/* \
    /tmp/*
