FROM ubuntu  

RUN apt-get update; \  
    apt-get -y upgrade

#RUN apt-get purge openjdk-\* icedtea-\* icedtea6-\*

RUN add-apt-repository "deb http://ppa.launchpad.net/ferramroberto/java/ubuntu natty main"; \
    add-apt-repository "deb http://archive.canonical.com/ubuntu maverick partner"; \
    apt-get -y update

#RUN apt-get -y install sun-java6-jre sun-java6-plugin

#RUN apt-get -y install sun-java6-jdk sun-java6-plugin

RUN apt-get -y install bison g++-multilib git gperf libxml2-utils

RUN apt-get -y install dpkg-dev git gnupg flex bison gperf build-essential \
  zip curl libc6-dev x11proto-core-dev \
  libgl1-mesa-dev g++-multilib mingw32 tofrodos \
  python-markdown libxml2-utils xsltproc

RUN ln -s /usr/lib/i386-linux-gnu/mesa/libGL.so.1 /usr/lib/i386-linux-gnu/libGL.so
