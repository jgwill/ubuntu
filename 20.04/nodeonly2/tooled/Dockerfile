# syntax=docker/dockerfile:1.2

#FROM jgwill/ubuntu:18.04-py3.7.2-lzma
FROM jgwill/ubuntu:20.04-node

ARG nodeversion=16.x


WORKDIR /root

WORKDIR /work

#RUN npm --version
RUN \ 
 	npm install npm --g 
	
RUN 	npm install tlid droxul http-server  --g
RUN \
	npm install \
	node-gyp   \
	--g
RUN \
        npm install \
        json2bash   \
	--g

RUN \
        npm install \
        thumbsup \
	yarn \
	--g







#WORKDIR /tmp
#RUN \
#    --mount=type=cache,target=/root/.npm \
#	ng new my-app --defaults && cd my-app && ng add @angular/material
# && rm -rf my-app


WORKDIR /work


