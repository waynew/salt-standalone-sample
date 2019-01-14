FROM ubuntu:18.04
MAINTAINER Wayne Werner <wwerner@saltstack.com>

RUN echo "tzdata tzdata/Areas select Etc" >/tmp/fnord
RUN echo "tzdata tzdata/Zones/Etc select UTC" >>/tmp/fnord
RUN debconf-set-selections /tmp/fnord
RUN apt-get update
RUN apt-get install -y tzdata
RUN apt-get install -y apt-utils git build-essential
RUN echo "deb http://archive.ubuntu.com/ubuntu bionic main universe multiverse restricted" > /etc/apt/sources.list && \
echo "deb http://archive.ubuntu.com/ubuntu bionic-security main universe multiverse restricted" >> /etc/apt/sources.list && \
apt-get update && \
apt-get upgrade -y -o DPkg::Options::=--force-confold


## Add the Salt PPA
RUN echo "deb http://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest bionic main" > /etc/apt/sources.list.d/saltstack.list
RUN apt-get install -y -o DPkg::Options::=--force-confold  software-properties-common curl && \
curl https://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest/SALTSTACK-GPG-KEY.pub | apt-key add - && \
apt-get update

## Install Salt Dependencies
RUN apt-get install -y -o DPkg::Options::=--force-confold \
python \
python-yaml \
python-m2crypto \
python-crypto \
msgpack-python \
python-zmq \
python-jinja2 \
python-requests \
salt-minion


WORKDIR /path/to/repo
EXPOSE 5042
