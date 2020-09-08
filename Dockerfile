FROM alpine

LABEL maintainer "Firdavs Murodov - https://github.com/firdavsich"

RUN apk add --no-cache openssh 
RUN mkdir /var/run/sshd

# Disable password login
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

# add ssh user
RUN useradd sshuser -m -s /bin/bash

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
