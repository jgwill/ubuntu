# syntax=docker/dockerfile:1.2


FROM jgwill/ubuntu:20.04-py3.10.11-base-lzma

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
	DEBIAN_FRONTEND=noninteractive apt update && apt install -y build-essential  \
		zlib1g-dev \
		libncurses5-dev libgdbm-dev libnss3-dev libssl-dev \
		libreadline-dev libffi-dev  \ 
        	libsqlite3-dev libbz2-dev  liblzma-dev lzma make \
		gfortran libopenblas-dev liblapack-dev pkg-config libboost-all-dev \
		unixodbc-dev cmake  python3-urllib3 python3-requests ssh-import-id  libc6-dbg 
RUN \
    --mount=type=cache,target=/var/cache/apt \
        DEBIAN_FRONTEND=noninteractive apt update && \
	apt install -y gcc-8 g++-8 && \
	update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 1 && \
	update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 1


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
	#ln -sf /usr/local/bin/python3.7 /usr/local/bin/python3 && \
  #ln -sf /usr/local/bin/python3.7 /usr/local/bin/python && \
  #ln -sf /usr/local/bin/pip3.7 /usr/local/bin/pip
#RUN update-alternatives --install /usr/bin/python python /usr/local/bin/python3.7 1
#RUN update-alternatives --install /usr/bin/pip pip /usr/local/bin/pip3.7 1

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
#RUN rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/America/New_York /etc/localtime



# Migrated from the ./ml
#RUN \
#    --mount=type=cache,target=/var/cache/apt \
#	apt install -y gfortran libopenblas-dev liblapack-dev pkg-config libboost-all-dev unixodbc-dev cmake  python3-urllib3 python3-requests ssh-import-id  libc6-dbg

#RUN \
#    --mount=type=cache,target=/var/cache/apt \
#        apt update && apt upgrade -y

# Some more info on pyodbc
#RUN apt install  unixodbc-dev -y
#RUN \
#    --mount=type=cache,target=/root/.cache \
#	pip install --upgrade pip
RUN \
    --mount=type=cache,target=/root/.cache \
	pip install  pyodbc urlopen colour plotly bokeh dropbox notebook ipywidgets \
	 jupyterlab opencv-python python-dotenv 
#RUN \
#    --mount=type=cache,target=/root/.cache \
#	pip list -o | cut -f1 -d' ' | tr " " "\n" | awk '{if(NR>=3)print}' | cut -d' ' -f1 | xargs -n1 pip install -U
	#pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U


USER root
WORKDIR /work
#RUN apt update


