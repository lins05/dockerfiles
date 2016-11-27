FROM ubuntu:14.04

ENV DEBIAN_FRONTEND=noninteractive \
    JAVA_HOME=/usr/lib/jvm/java-8-oracle/

# Oracle Java 8
RUN apt-get update -qq && \
    apt-get install -y curl python apt-transport-https && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 8756C4F765C9AC3CB6B85D62379CE192D401AB61 && \
    echo "deb https://dl.bintray.com/scrapinghub/3rdparty trusty main" > /etc/apt/sources.list.d/scrapinghub.list && \
    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    apt-get update -qq && \
    apt-get install -y oracle-java8-installer oracle-java8-set-default

# Python Dev packages
RUN apt-get update -qq && \
    apt-get install -qy \
        build-essential \
        git \
        libevent-dev \
        libffi-dev \
        libfreetype6-dev \
        libjpeg8-dev \
        libmysqlclient-dev \
        libpcre3-dev \
        libpq-dev \
        libssl-dev \
        libssl-dev \
        libxml2-dev \
        libxslt1-dev \
        libz-dev \
        pkg-config \
        python-dev

# pip & wheel
RUN curl -o /tmp/get-pip.py https://bootstrap.pypa.io/get-pip.py && \
    python /tmp/get-pip.py && \
    rm -rf /tmp/get-pip.py && \
    pip install -U wheel && \
    pip install requests[security]==2.10.0

# Maven
RUN curl -q -o - http://www.eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz \
    | tar xzf - -C /usr/local/ \
    && ln -sf /usr/local/apache-maven-3.3.9/bin/mvn /usr/bin/mvn

# SBT
ADD sbt /usr/bin/sbt

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
