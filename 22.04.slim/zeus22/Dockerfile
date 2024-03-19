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
    apt-transport-https  \
     			supervisor
          



#RUN curl -fsSL https://packages.microsoft.com/keys/microsoft.asc |  gpg --dearmor -o /usr/share/keyrings/microsoft-prod.gpg

RUN \
    --mount=type=cache,target=/var/cache/apt \
    curl https://packages.microsoft.com/keys/microsoft.asc | tee /etc/apt/trusted.gpg.d/microsoft.asc

RUN \
    --mount=type=cache,target=/var/cache/apt \
    curl -fsSL https://packages.microsoft.com/config/ubuntu/22.04/mssql-server-2022.list |  tee /etc/apt/sources.list.d/mssql-server-2022.list

RUN \
    --mount=type=cache,target=/var/cache/apt \
    apt update  && apt install -y mssql-server
    
RUN \
    --mount=type=cache,target=/var/cache/apt \
    apt install systemctl -y
    
#&& apt-get install -y mssql-server