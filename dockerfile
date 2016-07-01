# Created on Jul. 1, 2016
# @author: Sam

FROM ubuntu:16.04

MAINTAINER samsam2310@gmail.com

# install python2.7
RUN apt-get update && apt-get install python2.7 wget cron
# link python to python2.7
RUN ln -s python2.7 python && ln -s python2.7 python2
# install pip
RUN wget https://bootstrap.pypa.io/get-pip.py -O- | python
