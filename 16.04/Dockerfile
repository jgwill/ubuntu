FROM ubuntu:16.04
ENV DEBIAN_FRONTEND=noninteractive

  # DEBIAN_FRONTEND=noninteractive TZ="America/New_York" apt-get -y install tzdata && \
RUN apt update && \
 	apt upgrade -y && \
  DEBIAN_FRONTEND=noninteractive  apt -y install vim git curl && \
  apt install -y wget bzip2 && \
  apt install -y sudo && \
  apt install -y xterm && \
  apt install -y gnupg2 && \
  apt install -y curl apt-transport-https && \
  apt install ffmpeg libimage-exiftool-perl -y && \
	apt clean && \
	rm -rf /var/lib/apt/lists/*

# install supporting packages
RUN apt-get update && \
    apt-get install -y apt-transport-https \
                       curl \
                       supervisor \
                       fakechroot \
                       locales \
                       iptables \
                       sudo \
                       wget \
                       curl \
                       zip \
                       unzip \
                       make \
                       bzip2 \
                       m4 \
                       apt-transport-https \
                       tzdata \
                       libnuma-dev \
                       libsss-nss-idmap-dev \
                       software-properties-common


# Add user ubuntu with no password, add to sudo group
#@urir http://www.science.smith.edu/dftwiki/index.php/Tutorial:_Docker_Anaconda_Python_--_4
#RUN adduser --disabled-password --gecos '' ubuntu
#RUN adduser ubuntu sudo
#RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
#USER ubuntu
#WORKDIR /home/ubuntu/
#RUN chmod a+rwx /home/ubuntu/


USER root

#RUN apt update


