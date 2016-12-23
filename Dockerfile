FROM ubuntu:14.04
MAINTAINER cgboy "https://github.com/"

RUN apt-get update
RUN apt-get install -y openssh-server
  #RUN mkdir /var/run/sshd
RUN sed -i 's/^PermitRootLogin/#PermitRootLogin/' /etc/ssh/sshd_config
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN echo "root:root" | chpasswd
EXPOSE 22
CMD    ["/usr/sbin/sshd", "-D"]
