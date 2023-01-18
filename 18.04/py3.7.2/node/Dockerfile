# syntax=docker/dockerfile:1.2

FROM jgwill/ubuntu:18.04-py3.7.2-lzma
ARG pip_parent=pip3.7
ARG pip_cur=pip3.10
ARG nodeversion=16.x
ARG jgwnodedepspath=/tmp/jgw-node-deps
#WORKDIR /tmp

#RUN \
#    --mount=type=cache,target=/var/cache/apt \
#        bash apt-cleaner.sh
#RUN \
#    --mount=type=cache,target=/var/cache/apt \
#    apt update  && \
#        apt install -y  gcc g++

#WORKDIR /tmpcache2
#RUN \
#    --mount=type=cache,target=/tmpcache2 \
#         if [ ! -e  "node-v16.18.1.tar.gz" ] ;then  wget https://nodejs.org/dist/latest-v16.x/node-v16.18.1.tar.gz   ;fi
        #ln -sf /usr/local/bin/python3.7 /usr/local/bin/python3 && \I
  #ln -sf /usr/local/bin/python3.7 /usr/local/bin/python && \
  #ln -sf /usr/local/bin/pip3.7 /usr/local/bin/pip

#RUN \
#    --mount=type=cache,target=/tmpcache2 \
#        mkdir -p /usr/local/src && cd /usr/local/src && tar xzf /tmpcache2/node-v16.18.1.tar.gz
#WORKDIR ${jgwnodedepspath}
#COPY build/pack .
#WORKDIR /usr/local/src/node-v16.18.1/deps
#COPY build/jgw-deps-downloder-url.sh .
#RUN bash jgw-deps-downloder-url.sh
#RUN srcdir=$jgwnodedepspath/build/pack;cdir=$(pwd);for p in $(cd $srcdir;ls *tgz);do pname=$(echo $p | sed 's/\.tgz//g') ;echo "$pname" ;tar  -xzf $srcdir/$p;mv package $pname &>/dev/null;pwd;cd $cdir;done && rm -rf $ç<F12>jgwnodedepspath
#WORKDIR /usr/local/src/node-v16.18.1







#WORKDIR /tmpcache2/openssl
#RUN \
#    --mount=type=cache,target=/tmpcache2 \
#	if [ ! -e "config" ] ; then git clone https://github.com/quictls/openssl.git . && \
#	export prefix_target=/tmpcache2/src/node-v16.18.1/deps/openssl && \
#	if [ -e $prefix_target ]; then rm -rf $prefix_target;fi && \
#	./config \
#		--prefix=$prefix_target \
#		 shared \
#		enable-fips \
#		linux-x86_64 && \
#	make -j4 ;fi && \
#	make install
#RUN cd openssl && \ 
#./config \
#  --prefix=/usr/local/src/node-v16.18.1/deps/ssl \
#  shared \
#  enable-fips \
#  linux-x86_64
#WORKDIR /work

#WORKDIR /usr/local/src/node-v16.18.1
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

  


