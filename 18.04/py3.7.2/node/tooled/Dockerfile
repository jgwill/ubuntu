# syntax=docker/dockerfile:1.2

#FROM jgwill/ubuntu:18.04-py3.7.2-lzma
FROM jgwill/ubuntu:18.04-py3.7.2-lzma-node
ARG pip_parent=pip3.7
ARG pip_cur=pip3.10
ARG nodeversion=16.x


WORKDIR /root

WORKDIR /work

#RUN npm --version
RUN \
    --mount=type=cache,target=/root/.npm \
 	npm install npm --g && \
	npm install tlid droxul http-server \
	node-gyp   \
        json2bash   \
        typescript  \
        thumbsup \
	yarn \
	@angular/cli \
	firebase-tools \
	--g







#WORKDIR /tmp
#RUN \
#    --mount=type=cache,target=/root/.npm \
#	ng new my-app --defaults && cd my-app && ng add @angular/material
# && rm -rf my-app


WORKDIR /work


