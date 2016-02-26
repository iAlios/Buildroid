FROM ubuntu:14.04

RUN sed -i "s/archive/cn.archive/g" `grep archive -rl /etc/apt/sources.list`

RUN apt-get update

RUN apt-get install -y git-core gnupg flex bison gperf build-essential \
  zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
  lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache \
  libgl1-mesa-dev libxml2-utils xsltproc unzip

RUN apt-get install -y openjdk-7-jdk wget unzip vim

RUN apt-get install -y openssh-server

RUN wget 'http://php.webtutor.pl/en/wp-content/uploads/2011/09/repo' -O /usr/local/bin/repo
RUN chmod +x /usr/local/bin/repo

RUN echo "export PATH=$PATH:/usr/local/bin/repo" >> /etc/profile

RUN mkdir -p /home/admin

RUN groupadd admin

# 设置用户 admin ，默认密码为 -p admin，但这里不好用，先进入 root 用户之后修改其对应的密码
# -p <PASSWORD> encrypted password of the new account 参见/etc/shadow
# 加密方式如下：
# |------------------+------------------|
# |       $1$        +      	MD5      |
# +------------------+------------------+
# |      $2a$        +     Blowfish     |
# +------------------+------------------+
# |       $5$        +      SHA-256     |
# +------------------+------------------+
# |       $6$        +      SHA-512     |
# +------------------+------------------+
# 上述为 /etc/shadow 文件中加密的方式
RUN useradd -d /home/admin -g sudo -G admin,root -ms /bin/bash admin -p admin

# 修改文件夹 own
RUN chown -R admin:admin /home/admin

# 设置默认用户
USER admin
WORKDIR /home/admin
