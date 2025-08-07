
#ARG UBUNTU_VER
#ARG PY_VER
#ARG PY_VER_BASE
#ARG TZ_NAME="America/New_York"

#ARG PY_VER
#ARG PY_VER_BASE
ARG DK_TAG
FROM ${DK_TAG}
#FROM jgwill/ubuntu:${UBUNTU_VER}-py${PY_VER}-base




ENV DEBIAN_FRONTEND=noninteractive


# Inst build essential
#RUN \
#    --mount=type=cache,target=/var/cache/apt \
#	DEBIAN_FRONTEND=noninteractive apt update && apt install -y build-essential  \
#		zlib1g-dev \
#		libncurses5-dev libgdbm-dev libnss3-dev libssl-dev \
#		libreadline-dev libffi-dev  \ 
#        	libsqlite3-dev libbz2-dev  liblzma-dev lzma make \
#		gfortran libopenblas-dev liblapack-dev pkg-config libboost-all-dev \
#		unixodbc-dev cmake  python3-urllib3 python3-requests ssh-import-id  libc6-dbg 

#Slim
RUN \
    --mount=type=cache,target=/var/cache/apt \
        DEBIAN_FRONTEND=noninteractive apt update && \
	apt install -y lzma ssh-import-id
#RUN \
#    --mount=type=cache,target=/var/cache/apt \
#        DEBIAN_FRONTEND=noninteractive apt update && \
#	apt install -y gcc-9 g++-9 && \
#	update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 1 && \
#	update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 1




WORKDIR /



#RUN \
#    --mount=type=cache,target=/root/.cache \
#	pip install  pyodbc urlopen colour plotly bokeh dropbox notebook ipywidgets \
#	 jupyterlab opencv-python python-dotenv 
#slim
RUN \
    --mount=type=cache,target=/root/.cache \
        pip install  pyodbc urlopen colour plotly bokeh dropbox  \
         opencv-python python-dotenv 



USER root






WORKDIR /work



