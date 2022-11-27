

FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /__jgwillinstall
COPY build/jgw_optimize_docker_build.sh .
RUN bash jgw_optimize_docker_build.sh
WORKDIR /root

#RUN \
#    --mount=type=cache,target=/var/lib/apt/lists \
#	apt update
RUN \
    --mount=type=cache,target=/var/cache/apt \ 
 	apt update && apt upgrade -y
RUN \
    --mount=type=cache,target=/var/cache/apt \
	DEBIAN_FRONTEND=noninteractive  apt -y install \
	vim git curl zip unzip \
   wget bzip2\
   sudo \
    xterm  \
   gnupg2  \
    apt-transport-https  \
   ffmpeg libimage-exiftool-perl \
	lsb-release  \
     			supervisor \
                       fakechroot \
                       locales \
                       iptables \
                       make \
                       m4 \
                       tzdata \
                       libnuma-dev \
                       libsss-nss-idmap-dev \
                       software-properties-common   \
			iputils-ping net-tools dnsutils  markdown  
#		apt remove python3.5 -y && \
#      		apt remove python2.7 -y  && apt autoremove -y
#RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.8 2		


#Remove python 3.5
#RUN apt remove python3.5 -y && \
#      apt remove python2.7 -y && \
#      apt autoremove -y


USER root

#RUN apt update && apt install iputils-ping net-tools -y && \
#	apt install dnsutils -y && \
#	apt install lsb-release -y && \
#	apt install markdown -y && apt autoremove -y

#RUN apt install -y xterm

