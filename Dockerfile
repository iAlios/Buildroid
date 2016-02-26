FROM ubuntu:14.04

RUN sed -i "s/archive/cn.archive/g" `grep archive -rl /etc/apt/sources.list`

RUN apt-get update

RUN apt-get install -y git-core gnupg flex bison gperf build-essential \
  zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
  lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache \
  libgl1-mesa-dev libxml2-utils xsltproc unzip

RUN apt-get install -y openjdk-7-jdk wget unzip vim

RUN wget 'http://php.webtutor.pl/en/wp-content/uploads/2011/09/repo' -O /usr/local/bin/repo
RUN chmod +x /usr/local/bin/repo

RUN echo "export PATH=$PATH:/usr/local/bin/repo" >> /etc/profile

RUN mkdir -p /home/admin

RUN useradd -d /home/admin -g sudo -ms /bin/bash admin
USER admin
WORKDIR /home/admin
