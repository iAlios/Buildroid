FROM ubuntu:14.04

# 设置中国国内的源
RUN sed -i "s/archive/cn.archive/g" `grep archive -rl /etc/apt/sources.list`

RUN apt-get update

# 安装 android 编译环境
RUN apt-get install -y git-core gnupg flex bison gperf build-essential \
  zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
  lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache \
  libgl1-mesa-dev libxml2-utils xsltproc unzip

# 安装 java 环境等
RUN apt-get install -y openjdk-7-jdk wget unzip vim

# 下载 repo 工具
RUN wget 'http://php.webtutor.pl/en/wp-content/uploads/2011/09/repo' -O /usr/local/bin/repo
RUN chmod +x /usr/local/bin/repo

# 配置环境 PATH
RUN echo "export PATH=$PATH:/usr/local/bin/repo" >> /etc/profile

# 创建 home 目录
RUN mkdir -p /home/admin

# 创建用户 admin
RUN useradd -d /home/admin -g sudo -ms /bin/bash admin -p admin
RUN usermod –p admin admin
# 设置默认进入的用户
USER admin
# 设置工作目录
WORKDIR /home/admin
