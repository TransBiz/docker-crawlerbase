# Created on Jul. 1, 2016
# @author: Sam

FROM ubuntu:16.04

MAINTAINER samsam2310@gmail.com

# install python2.7 && wget && cron/crontab
RUN apt-get update && apt-get install -y python2.7 wget cron
# link python to python2.7
RUN ln -s /usr/bin/python2.7 /usr/bin/python && ln -s /usr/bin/python2.7 /usr/bin/python2
# install pip
RUN wget https://bootstrap.pypa.io/get-pip.py -O- | python
# install libxml2-dev(for python-lxml)
RUN apt-get update && apt-get install -y libxml2-dev
