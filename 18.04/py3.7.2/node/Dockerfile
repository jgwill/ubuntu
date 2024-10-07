# syntax=docker/dockerfile:1.2

FROM jgwill/ubuntu:18.04-py3.7.2-lzma
ARG pip_parent=pip3.7
ARG pip_cur=pip3.10
ARG nodeversion=16.x
ARG jgwnodedepspath=/tmp/jgw-node-deps
#WORKDIR /tmp

WORKDIR /usr/local/src
WORKDIR /tmpcache2

#RUN \
# --mount=type=cache,target=/tmpcache2 \
#	rm -rf src *gz && sleep 5

#node-v16.18.1.tar.gz
# NOT WORKING : ./configure --with-intl=full-icu --without-intl
# wget https://github.com/unicode-org/icu/archive/refs/tags/release-72-1.tar.gz ;fi && \
#  --with-icu-source=/tmpcache2/release-72-1.tar.gz && echo "https://github.com/unicode-org/icu/archive/refs/tags/release-72-1.tar.gz" && \
WORKDIR /tmpcache2
RUN \
    --mount=type=cache,target=/tmpcache2 \
         if [ ! -e  "node-v16.18.1.tar.gz" ] ;then  wget https://nodejs.org/dist/latest-v16.x/node-v16.18.1.tar.gz ;fi && \ 
	if [ ! -d "src" ]; then	mkdir -p src && cd src && tar xzf /tmpcache2/node-v16.18.1.tar.gz && \
		cd node-v16.18.1 && \
			./configure \
    				--with-intl=full-icu && \ 
 		make -j8;fi && \
 		cd /tmpcache2/src/node-v16.18.1 ; make install 

  


