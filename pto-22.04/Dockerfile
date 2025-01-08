ARG UBUNTU_VER=22.04
FROM ubuntu:${UBUNTU_VER}

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /__jgwillinstall
COPY build/jgw_optimize_docker_build.sh .
RUN echo " ">>jgw_optimize_docker_build.sh
RUN bash jgw_optimize_docker_build.sh
WORKDIR /root
RUN mkdir -p tmp 


RUN \
    --mount=type=cache,target=/var/cache/apt \ 
 	apt update && apt upgrade -y

RUN \
    --mount=type=cache,target=/var/cache/apt \
	DEBIAN_FRONTEND=noninteractive  apt -y install \
	vim git curl zip unzip \
   wget bzip2\
   sudo \ 
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
                      iputils-ping net-tools dnsutils iproute2 \
                        markdown  \
                        dos2unix \
                        imagemagick   exiftool  graphicsmagick  



USER root



