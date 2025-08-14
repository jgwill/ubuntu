FROM jgwill/ubuntu:18.04
ARG PY_VER=3.6.15
ARG PY_VER_BASE=3.6
ARG TZ_NAME="America/New_York"

ENV DEBIAN_FRONTEND=noninteractive

# Install build essential and Python 3.6 (available by default in 20.04)
RUN \
    --mount=type=cache,target=/var/cache/apt \
 	DEBIAN_FRONTEND=noninteractive apt update && apt install -y \
 		software-properties-common \
 		build-essential \
 		zlib1g-dev \
 		libncurses5-dev libgdbm-dev libnss3-dev libssl-dev \
 		libreadline-dev libffi-dev \
        libsqlite3-dev libbz2-dev liblzma-dev lzma make \
 		gfortran libopenblas-dev liblapack-dev pkg-config libboost-all-dev \
 		unixodbc-dev cmake python3-urllib3 python3-requests ssh-import-id libc6-dbg \
 		gcc g++ wget curl \
		python${PY_VER_BASE} python${PY_VER_BASE}-dev python3-distutils && \
	rm -rf /var/lib/apt/lists/*

# Install pip for Python 3.6 using get-pip.py
RUN \
    --mount=type=cache,target=/root/.cache \
	wget https://bootstrap.pypa.io/pip/3.6/get-pip.py -O get-pip.py && \
	python${PY_VER_BASE} get-pip.py && \
	rm get-pip.py

# Create symbolic links for python and pip
RUN ln -sf /usr/bin/python${PY_VER_BASE} /usr/local/bin/python3 && \
  ln -sf /usr/bin/python${PY_VER_BASE} /usr/local/bin/python && \
  ln -sf /usr/local/bin/pip${PY_VER_BASE} /usr/local/bin/pip && \
  ln -sf /usr/local/bin/pip${PY_VER_BASE} /usr/local/bin/pip3

WORKDIR /

# Set timezone
RUN rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/${TZ_NAME} /etc/localtime

# Install Python packages
RUN \
--mount=type=cache,target=/root/.cache \
	/usr/local/bin/pip${PY_VER_BASE} install --upgrade pip && \
	/usr/local/bin/pip${PY_VER_BASE} install gyp-next

USER root
WORKDIR /work
