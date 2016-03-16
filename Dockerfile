FROM ubuntu:14.04

# 设置中国国内的源
RUN sed -i "s/archive/cn.archive/g" `grep archive -rl /etc/apt/sources.list`

RUN apt-get update

# 安装 android 编译环境
RUN apt-get install -y git-core gnupg flex bison gperf build-essential \
  zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
  lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache \
  libgl1-mesa-dev libxml2-utils xsltproc unzip

# android x86 默认使用工具安装
# RUN apt-get install -y syslinux-utils
# RUN apt-get install -y gettext
# RUN apt-get install -y python-pip
# # RUN apt-get install -y pyramid_mako
# RUN wget https://pypi.python.org/packages/source/p/pyramid_mako/pyramid_mako-1.0.2.tar.gz
# RUN tar xf pyramid_mako-1.0.2.tar.gz
# RUN cd pyramid_mako-1.0.2
# RUN python setup.py install

# 安装 java 环境等工具
RUN apt-get install -y openjdk-7-jdk wget unzip vim

# 安装 ssh server
RUN apt-get install -y openssh-server

# 下载 repo 工具
RUN wget 'http://php.webtutor.pl/en/wp-content/uploads/2011/09/repo' -O /usr/local/bin/repo
RUN chmod +x /usr/local/bin/repo

# 配置环境 PATH
RUN echo "export PATH=$PATH:/usr/local/bin/repo" >> /etc/profile

# 将 ssh server 设置为默认开机启动程序
RUN touch /usr/local/bin/test
RUN sed 's/^exit 0//p' /etc/rc.local > /usr/local/bin/test
RUN echo "/etc/init.d/ssh start" >> /usr/local/bin/test
RUN echo "exit 0" >> /usr/local/bin/test
RUN mv /usr/local/bin/test /etc/rc.local

# 创建 home 目录
RUN mkdir -p /home/admin

# 创建 admin 用户组
RUN groupadd admin

# 设置用户 admin ，默认密码为 -p admin，但这里不好用，先进入 root 用户之后修改其对应的密码
# -p <PASSWORD> encrypted password of the new account 参见/etc/shadow
# 加密方式如下：
# +------------------+------------------+
# |       $1$        +        MD5       |
# +------------------+------------------+
# |      $2a$        +     Blowfish     |
# +------------------+------------------+
# |       $5$        +      SHA-256     |
# +------------------+------------------+
# |       $6$        +      SHA-512     |
# +------------------+------------------+
# 上述为 /etc/shadow 文件中加密的方式
#
# 最简单的方式找台机器创建用户及密码，将其copy过来即可
#
# 比如：
# admin 通过 SHA-512 加密之后的结果为 $6$R6bmPnMl$i7/CDyVyKKbGEjRUGtEffMMJKNbeoZY93aamU8axq3FPr9N9nNJWe7YNhurMRb4j0NvyALpTYJwC8y.mQqQpE/
#
RUN useradd -d /home/admin -g sudo -G admin,root -ms /bin/bash admin -p \$6\$R6bmPnMl\$i7/CDyVyKKbGEjRUGtEffMMJKNbeoZY93aamU8axq3FPr9N9nNJWe7YNhurMRb4j0NvyALpTYJwC8y.mQqQpE/

# 修改文件夹 own
RUN chown -R admin:admin /home/admin

# 设置默认用户
USER admin

# 设置默认工作目录
WORKDIR /home/admin
