FROM jgwill/ubuntu:16.04

RUN apt update && apt-get upgrade -y

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get install build-essential libssl-dev cmake apt-utils apt-transport-https debconf-utils gcc g++ -y\
&& rm -rf /var/lib/apt/lists/*


#RUN apt-get update && apt-get install -y \
#    curl apt-utils apt-transport-https debconf-utils gcc build-essential g++-5\
#        && rm -rf /var/lib/apt/lists/*

