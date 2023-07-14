FROM jgwill/ubuntu:20.04-node

ENV DEBIAN_FRONTEND=noninteractive

RUN \
        add-apt-repository ppa:deadsnakes/ppa \
	&& apt remove python3.8 -y \
	&& DEBIAN_FRONTEND=noninteractive apt update && apt install -y build-essential  \
 		zlib1g-dev \
 		libncurses5-dev libgdbm-dev libnss3-dev libssl-dev \
 		libreadline-dev libffi-dev  \ 
         	libsqlite3-dev libbz2-dev  liblzma-dev lzma make \
 		gfortran libopenblas-dev liblapack-dev pkg-config libboost-all-dev \
 		unixodbc-dev cmake  ssh-import-id  libc6-dbg \
 		gcc g++ liblzma-dev lzma \
		software-properties-common \
		python3.10 \
		python3-urllib3 python3-requests \
	&& apt clean

#	rm -rf /var/lib/apt/lists/*
#RUN apt update && apt install -y liblzma-dev lzma

WORKDIR /tmp

RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10

#RUN \
# DEBIAN_FRONTEND=noninteractive	apt install python3.10 -y

#docker prune -a
	#ln -sf /usr/local/bin/python3.7 /usr/local/bin/python3 && \
  #ln -sf /usr/local/bin/python3.7 /usr/local/bin/python && \
  #ln -sf /usr/local/bin/pip3.7 /usr/local/bin/pip
#RUN update-alternatives --install /usr/bin/python python /usr/local/bin/python3.10 1
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.10 1
#RUN update-alternatives --install /usr/bin/pip pip /usr/local/bin/pip3.10 1
RUN update-alternatives --install /usr/bin/pip pip /usr/local/bin/pip3.10 1



WORKDIR /



RUN rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/America/New_York /etc/localtime


#RUN \
#--mount=type=cache,target=/root/.cache \
#	pip install --upgrade pip && \
#	pip install  gyp-next



USER root
WORKDIR /work



