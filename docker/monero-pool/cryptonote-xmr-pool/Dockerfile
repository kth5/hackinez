FROM ubuntu:16.04

ENV SRC_DIR /usr/local/src/cryptonote-xmr-pool

RUN set -x \
  && buildDeps=' \
      ca-certificates \
      git \
      libboost1.58-all-dev \
      nodejs-dev \
      nodejs-legacy\
      npm \
      cmake \
      build-essential \
      libssl-dev \
  ' \
  && apt-get update \
  && apt-get -y --no-install-recommends install $buildDeps

RUN git config --global user.email 'alex.bldck@gmail.com'
RUN git config --global user.name 'kth5'
RUN git clone https://github.com/clintar/cryptonote-xmr-pool.git $SRC_DIR
WORKDIR $SRC_DIR
RUN git pull https://github.com/fireice-uk/cryptonote-xmr-pool.git master

RUN npm install

RUN apt-get -y --auto-remove purge $buildDeps

ADD config.json $SRC_DIR

ENV STRATUM_LOW 3333
ENV STRATUM_MID 5555
ENV STRATUM_HIH 7777
ENV STRATUM_PRV 8888 
ENV API 8117

EXPOSE $STRATUM_LOW 
EXPOSE $STRATUM_MID
EXPOSE $STRATUM_HIH
EXPOSE $API

CMD node init.js 
