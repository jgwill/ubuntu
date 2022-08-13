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


#Remove python 3.5
RUN apt remove python3.5 -y && \
      apt remove python2.7 -y && \
      apt autoremove -y


# BUild python 3.7

# Inst build essential
RUN apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev && \
  apt clean && \
	rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
RUN wget https://www.python.org/ftp/python/3.7.1/Python-3.7.1.tgz && \
    tar -xf Python-3.7.1.tgz && \
	cd Python-3.7.1 && ./configure --enable-optimizations && \
 	make -j 8 && make altinstall && cd .. && rm -rf Python-3.7.1 && rm Python-3.7.1.tgz

# Linking regular python cmd so python and python3 cmd will works
RUN  ln -sf /usr/local/bin/python3.7 /usr/local/bin/python3 && \
  ln -sf /usr/local/bin/python3.7 /usr/local/bin/python && \
  ln -sf /usr/local/bin/pip3.7 /usr/local/bin/pip && \
  ln -sf /usr/local/bin/pip3.7 /usr/local/bin/pip

WORKDIR /


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


