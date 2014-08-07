FROM phusion/baseimage:0.9.12
ENV  HOME /root

RUN apt-get -y update &&\
    apt-get -y install build-essential git curl wget \
                       libxslt-dev libcurl4-openssl-dev \
                       libssl-dev libyaml-dev libtool \
                       libxml2-dev libreadline-dev &&\
    echo 'gem: --no-document' >> /usr/local/etc/gemrc &&\
    mkdir /src && cd /src && git clone https://github.com/sstephenson/ruby-build.git &&\
    cd /src/ruby-build && ./install.sh && cd / && rm -rf /src/ruby-build &&\
    ruby-build 1.9.3-p547 /usr/local &&\
    gem update --system &&\
    gem install bundler &&\
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
