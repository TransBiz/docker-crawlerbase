# Created on Jul. 1, 2016
# @author: Sam

FROM ubuntu:16.04

MAINTAINER samsam2310@gmail.com

# install python2.7 && python-dev && wget && cron/crontab
RUN apt-get update && apt-get install -y python2.7 python-dev wget cron
# install pip
RUN wget https://bootstrap.pypa.io/get-pip.py -O- | python
# install libxml2-dev libxslt1-dev(for python-lxml)
RUN apt-get update && apt-get install -y libxml2-dev libxslt1-dev
