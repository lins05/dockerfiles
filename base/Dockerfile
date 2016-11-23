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
        libpcre3-dev libz-dev && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# install pip/wheel
RUN curl -o /tmp/get-pip.py https://bootstrap.pypa.io/get-pip.py && \
    python /tmp/get-pip.py && \
    rm -rf /tmp/get-pip.py && \
    pip install --no-cache-dir -U wheel && \
    pip install --no-cache-dir requests[security]==2.10.0 && \
    rm -rf ~/.cache/pip
