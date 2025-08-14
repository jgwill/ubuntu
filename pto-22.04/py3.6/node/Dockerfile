ARG UBUNTU_VER=18.04
FROM jgwill/ubuntu:py3.6
#jgwill/ubuntu:py
ARG TZ_NAME="America/New_York"

ENV DEBIAN_FRONTEND=noninteractive




RUN rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/${TZ_NAME} /etc/localtime

# node
RUN \
    --mount=type=cache,target=/var/cache/apt \
        DEBIAN_FRONTEND=noninteractive apt update && \
        apt install -y ca-certificates curl gnupg
#RUN \
#        mkdir -p /etc/apt/keyrings && \
#        curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key |  gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
#RUN \
#    --mount=type=cache,target=/var/cache/apt \
#        echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list

#RUN \
#    --mount=type=cache,target=/var/cache/apt \
#        DEBIAN_FRONTEND=noninteractive apt update && \
#        apt install -y nodejs

#-------------IMPORTED from 16x
WORKDIR /tmpcache2
#RUN \
#    --mount=type=cache,target=/tmpcache2 \
#         if [ ! -e  "node-v16.20.2.tar.gz" ] ;then  wget https://nodejs.org/download/release/latest-v16.x/node-v16.20.2.tar.gz ;fi && \ 
#        if [ ! -d "src" ]; then mkdir -p src && cd src && tar xzf /tmpcache2/node-v16.20.2.tar.gz && \
#                cd node-v16.20.2 && \
#                        ./configure \
#                                --with-intl=full-icu && \ 
#                make -j8;fi && \
#                cd /tmpcache2/src/node-v16.20.2 && make install
#
RUN \
        curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh \
        && bash /tmp/nodesource_setup.sh \
        && apt install nodejs -y && \
	apt install node-npm-bundled node-is-npm -y && apt clean


#RUN npm install -g npm
#RUN npm install -g tlid tlidug json2bash
#RUN npm install -g droxul

