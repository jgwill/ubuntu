# syntax=jgwill/dev:dockerfile-1.4 


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
#RUN \
#    --mount=type=cache,target=/var/lib/apt/lists \
#	apt update

# Inst build essential
RUN \
    --mount=type=cache,target=/var/cache/apt \
	DEBIAN_FRONTEND=noninteractive apt update && apt install -y build-essential 

RUN \
    --mount=type=cache,target=/var/cache/apt \
        DEBIAN_FRONTEND=noninteractive apt install -y zlib1g-dev \
	libncurses5-dev libgdbm-dev libnss3-dev libssl-dev \
	libreadline-dev libffi-dev 
RUN \
    --mount=type=cache,target=/var/cache/apt \
        DEBIAN_FRONTEND=noninteractive apt install -y libsqlite3-dev libbz2-dev  liblzma-dev lzma make
#	rm -rf /var/lib/apt/lists/*
#RUN apt update && apt install -y liblzma-dev lzma

#WORKDIR /tmpcache
#RUN \
#    --mount=type=cache,target=/tmpcache \
#	if [ ! -e  "Python-3.7.2" ] ;then wget https://www.python.org/ftp/python/3.7.2/Python-3.7.2.tgz && tar -xf Python-3.7.2.tgz \
#	&& cd Python-3.7.2 && ./configure --enable-optimizations && \
#	make -j 8 && make altinstall; \
#	else \
#		cd Python-3.7.2 && make altinstall ;fi && \ 
#	echo rm -rf Python-3.7.2 && echo Python-3.7.2.tgz 



WORKDIR /tmpcache2
RUN \
    --mount=type=cache,target=/tmpcache2 \
     	 if [ ! -e  "Python-3.7.2.tgz" ] ;then wget https://www.python.org/ftp/python/3.7.2/Python-3.7.2.tgz && cd /opt && tar -xzf /tmpcache2/Python-3.7.2.tgz  && \
	 cd /tmpcache2 && wget https://nodejs.org/dist/latest-v16.x/node-v16.18.1.tar.gz && cd /opt && tar xzf /tmpcache2/node-v16.18.1.tar.gz  ;fi
	#ln -sf /usr/local/bin/python3.7 /usr/local/bin/python3 && \I
  #ln -sf /usr/local/bin/python3.7 /usr/local/bin/python && \
  #ln -sf /usr/local/bin/pip3.7 /usr/local/bin/pip
WORKDIR /tmpcache2
RUN \
    --mount=type=cache,target=/tmpcache2 \
	mkdir -p /usr/local/src && cd /usr/local/src && tar xzf /tmpcache2/Python-3.7.2.tgz && tar xzf /tmpcache2/node-v16.18.1.tar.gz

#RUN pip3 install --upgrade pip

# Linking regular python cmd so python and python3 cmd will works
#RUN  ln -sf /usr/local/bin/python3.7 /usr/local/bin/python3 && \
#  ln -sf /usr/local/bin/python3.7 /usr/local/bin/python && \
#  ln -sf /usr/local/bin/pip3.10 /usr/local/bin/pip 
  
#RUN pip3.10 install setuptools
#RUN apt update
#RUN apt install make -y

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
#RUN \
#    --mount=type=cache,target=/var/cache/apt \
#	apt install -y gfortran libopenblas-dev liblapack-dev pkg-config libboost-all-dev unixodbc-dev cmake
#RUN \
#    --mount=type=cache,target=/var/cache/apt \
#        apt update && apt upgrade -y

# Some more info on pyodbc
#RUN apt install  unixodbc-dev -y
#RUN \
#    --mount=type=cache,target=/root/.cache \
#	pip3.7 install --upgrade pip
#RUN \
#    --mount=type=cache,target=/root/.cache \
#	pip3.7 install  pyodbc urlopen colour plotly bokeh dropbox notebook ipywidgets


#RUN pip3.7 install --upgrade pip
#RUN pip3.7 install urlopen colour
#RUN pip3.7 install plotly bokeh
#RUN pip3.7 install dropbox notebook ipywidgets
#RUN pip3.7 install seaborn IN ML
#RUN \
#    --mount=type=cache,target=/root/.cache \
#	pip3.7 install jupyterlab opencv-python python-dotenv




USER root
WORKDIR /work
#RUN apt update


