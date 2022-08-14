FROM jgwill/ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive


# Moved to jgwill/ubuntu:18.04
# DEBIAN_FRONTEND=noninteractive TZ="America/New_York" apt-get -y install tzdata && \
# RUN apt update && \
#  	apt upgrade -y && \
#   DEBIAN_FRONTEND=noninteractive  apt -y install vim git curl && \
#   apt install -y wget bzip2 && \
#   apt install -y sudo && \
#   apt install -y xterm && \
#   apt install -y gnupg2 && \
#   apt install -y curl apt-transport-https && \
#   apt install ffmpeg libimage-exiftool-perl -y && \
# 	apt clean && \
# 	rm -rf /var/lib/apt/lists/*

# # install supporting packages
# RUN apt-get update && \
#     apt-get install -y apt-transport-https \
#                        curl \
#                        supervisor \
#                        fakechroot \
#                        locales \
#                        iptables \
#                        sudo \
#                        wget \
#                        curl \
#                        zip \
#                        unzip \
#                        make \
#                        bzip2 \
#                        m4 \
#                        apt-transport-https \
#                        tzdata \
#                        libnuma-dev \
#                        libsss-nss-idmap-dev \
#                        software-properties-common


# #Remove python 3.5
# RUN apt remove python3.5 -y && \
#       apt remove python2.7 -y && \
#       apt autoremove -y


# BUild python 3.7
RUN apt update
# Inst build essential
RUN DEBIAN_FRONTEND=noninteractive apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev && \
  apt clean && \
	rm -rf /var/lib/apt/lists/*
RUN apt update && apt install -y liblzma-dev lzma

WORKDIR /tmp
RUN wget https://www.python.org/ftp/python/3.7.2/Python-3.7.2.tgz && \
    tar -xf Python-3.7.2.tgz && \
	cd Python-3.7.2 && ./configure --enable-optimizations && \
 	make -j 8 && make altinstall && cd .. && rm -rf Python-3.7.2 && rm Python-3.7.2.tgz


#RUN pip3 install --upgrade pip

# Linking regular python cmd so python and python3 cmd will works
RUN  ln -sf /usr/local/bin/python3.7 /usr/local/bin/python3 && \
  ln -sf /usr/local/bin/python3.7 /usr/local/bin/python && \
  ln -sf /usr/local/bin/pip3.10 /usr/local/bin/pip 
  
#RUN pip3.10 install setuptools
RUN apt update
RUN apt install make -y

# RUN apt-get install -y gfortran libopenblas-dev liblapack-dev
# RUN apt-get install -y pkg-config
# # RUN apt-get install -y wget
# RUN apt-get install -y python3-setuptools

WORKDIR /


# Add user ubuntu with no password, add to sudo group
#@urir http://www.science.smith.edu/dftwiki/index.php/Tutorial:_Docker_Anaconda_Python_--_4
#RUN adduser --disabled-password --gecos '' ubuntu
#RUN adduser ubuntu sudo
#RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
#USER ubuntu
#WORKDIR /home/ubuntu/
#RUN chmod a+rwx /home/ubuntu/

#Damn TZ issue
RUN rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/America/New_York /etc/localtime



# Migrated from the ./ml
RUN apt install -y gfortran libopenblas-dev liblapack-dev
RUN apt install -y pkg-config
# migrated content from ./ml (which was further after pip installs)
RUN apt install libboost-all-dev -y
RUN apt install cmake make -y

# Some more info on pyodbc
RUN apt install  unixodbc-dev -y
RUN pip3.7 install  pyodbc

RUN apt install lsb-release -y

RUN pip3.7 install --upgrade pip

USER root

#RUN apt update


