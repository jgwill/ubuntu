FROM jgwill/ubuntu:22.04
ARG PY_VER
ARG PY_VER_BASE
ARG TZ_NAME="America/New_York"

ENV DEBIAN_FRONTEND=noninteractive



# # Inst build essential
RUN \
    --mount=type=cache,target=/var/cache/apt \
 	DEBIAN_FRONTEND=noninteractive apt update && apt install -y build-essential  \
 		zlib1g-dev \
 		libncurses5-dev libgdbm-dev libnss3-dev libssl-dev \
 		libreadline-dev libffi-dev  \ 
         	libsqlite3-dev libbz2-dev  liblzma-dev lzma make \
 		gfortran libopenblas-dev liblapack-dev pkg-config libboost-all-dev \
 		unixodbc-dev cmake  python3-urllib3 python3-requests ssh-import-id  libc6-dbg \
 		gcc g++ liblzma-dev lzma
#	rm -rf /var/lib/apt/lists/*
#RUN apt update && apt install -y liblzma-dev lzma

WORKDIR /tmpcache

RUN \
    --mount=type=cache,target=/tmpcache \
	if [ ! -e  "Python-${PY_VER}" ] ;then wget https://www.python.org/ftp/python/${PY_VER}/Python-${PY_VER}.tgz && tar -xf Python-${PY_VER}.tgz \
	&& cd Python-${PY_VER} && ./configure --enable-optimizations && \
	make -j 8 && make altinstall; \
	else \
		cd Python-${PY_VER} && make altinstall ;fi && \ 
	echo rm -rf Python-${PY_VER} && echo Python-${PY_VER}.tgz 
	#ln -sf /usr/local/bin/python3.7 /usr/local/bin/python3 && \
  #ln -sf /usr/local/bin/python3.7 /usr/local/bin/python && \
  #ln -sf /usr/local/bin/pip3.7 /usr/local/bin/pip
RUN update-alternatives --install /usr/bin/python python /usr/local/bin/python${PY_VER_BASE} 1
RUN update-alternatives --install /usr/bin/pip pip /usr/local/bin/pip${PY_VER_BASE} 1



WORKDIR /



RUN rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/${TZ_NAME} /etc/localtime


RUN \
--mount=type=cache,target=/root/.cache \
	pip install --upgrade pip && \
	pip install  gyp-next



USER root
WORKDIR /work



