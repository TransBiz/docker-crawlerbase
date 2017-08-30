# Created on Mar. 8, 2017
# @author: Yvictor

FROM ubuntu:14.04

MAINTAINER yvictor

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN apt-get update --fix-missing && apt-get install -y curl git make

#RUN apt-get update --fix-missing && apt-get install -y make g++ wget bzip2 ca-certificates \
    #libglib2.0-0 libxext6 libsm6 libxrender1 \
    #git mercurial subversion


ENV PYENV_ROOT /root/.pyenv
ENV PATH /root/.pyenv/shims:/root/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
RUN pyenv install miniconda3-4.1.11
RUN pyenv global miniconda3-4.1.11

# change to use pyenv to management python env
# RUN curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
# miniconda2-4.1.11

RUN apt-get install -y curl grep sed dpkg git xvfb firefox && \
    TINI_VERSION=`curl https://github.com/krallin/tini/releases/latest | grep -o "/v.*\"" | sed 's:^..\(.*\).$:\1:'` && \
    curl -L "https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini_${TINI_VERSION}.deb" > tini.deb && \
    dpkg -i tini.deb && \
    rm tini.deb && \
    apt-get clean

ADD https://github.com/mozilla/geckodriver/releases/download/v0.12.0/geckodriver-v0.12.0-linux64.tar.gz /usr/local/bin/
WORKDIR /usr/local/bin/
RUN tar -xvf geckodriver-v0.12.0-linux64.tar.gz && \
    rm geckodriver-v0.12.0-linux64.tar.gz

#RUN wget --quiet  -O ~/geckodriver.tar.gz && \
    #tar -xvf ~/geckodriver.tar.gz
    #rm ~/geckodriver.tar.gz \
    #mv ~/geckodriver /bin/geckodriver

#RUN curl "https://gist.githubusercontent.com/amberj/6695353/raw/d7d981379c9602e6323d09a90d6a84cd3e3177a2/setup-headless-selenium-xvfb.sh"
    #/bin/bash setup-headless-selenium-xvfb.sh


WORKDIR /home
# RUN conda config --set auto_update_conda False
RUN conda install -c anaconda beautifulsoup4 lxml=3.7.0 -y
RUN pip install selenium beautifulsoup4 xvfbwrapper PyVirtualDisplay requests pyquery pymongo python-amazon-mws celery raven

CMD [ "/bin/bash" ]

COPY . /docker-crawlerbase
WORKDIR /docker-crawlerbase

RUN python test.py

WORKDIR /home
RUN rm -r -f /docker-crawlerbase

