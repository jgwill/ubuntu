FROM ubuntu:16.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && \
 	apt upgrade -y

RUN  DEBIAN_FRONTEND=noninteractive  apt -y install \
vim git curl zip unzip \
   wget bzip2\
   sudo \
    xterm  \
   gnupg2  \
    apt-transport-https  \
   ffmpeg libimage-exiftool-perl 
RUN  DEBIAN_FRONTEND=noninteractive  apt -y install \
     supervisor \
                       fakechroot \
                       locales \
                       iptables \
                       make \
                       m4 \
                       tzdata \
                       libnuma-dev \
                       libsss-nss-idmap-dev \
                       software-properties-common && \
	apt clean && \
	rm -rf /var/lib/apt/lists/*


#Remove python 3.5
RUN apt remove python3.5 -y && \
      apt remove python2.7 -y && \
      apt autoremove -y


USER root

RUN apt update
RUN  apt install iputils-ping net-tools -y
RUN apt install dnsutils -y

RUN apt install markdown -y

#RUN apt install -y xterm

