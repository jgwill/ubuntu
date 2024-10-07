FROM ubuntu:22.04


ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /__jgwillinstall
COPY build/jgw_optimize_docker_build.sh .
RUN bash jgw_optimize_docker_build.sh
WORKDIR /root
RUN mkdir -p tmp 

#RUN \
#    --mount=type=cache,target=/var/lib/apt/lists \
#	apt update
RUN \
    --mount=type=cache,target=/var/cache/apt \ 
 	apt update && apt upgrade -y



RUN \
    --mount=type=cache,target=/var/cache/apt \
	DEBIAN_FRONTEND=noninteractive  apt -y install \
	vim git curl zip unzip \
   wget \
   gnupg2  \
    apt-transport-https \
    ca-certificates \
    systemctl


# for convenience
RUN \
    --mount=type=cache,target=/var/cache/apt \
        DEBIAN_FRONTEND=noninteractive  apt -y install \
	sudo
