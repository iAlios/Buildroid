FROM ubuntu  

RUN apt-get update; \  
    apt-get -y upgrade

RUN \
    echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    add-apt-repository -y ppa:webupd8team/java && \
    apt-get update && \
    apt-get install -y oracle-java7-installer

RUN apt-get -y install bison g++-multilib git gperf libxml2-utils

RUN apt-get -y install dpkg-dev git gnupg flex bison gperf build-essential \
  zip curl libc6-dev x11proto-core-dev \
  libgl1-mesa-dev g++-multilib mingw32 tofrodos \
  python-markdown libxml2-utils xsltproc
