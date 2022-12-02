FROM jgwill/ubuntu:18.04


#RUN \
#    --mount=type=cache,target=/var/cache/apt \
#	apt update && apt upgrade -y
RUN \
    --mount=type=cache,target=/var/cache/apt \ 
 add-apt-repository ppa:ondrej/php && \
 apt update 

RUN \
    --mount=type=cache,target=/var/cache/apt \
 apt install php8.1 -y && \
 apt install php8.1-fpm -y 

RUN \
    --mount=type=cache,target=/var/cache/apt \
	 apt install php8.1-common php8.1-mysql php8.1-xml \
	php8.1-xmlrpc php8.1-curl php8.1-gd php8.1-imagick \
 	php8.1-cli php8.1-dev php8.1-imap php8.1-mbstring php8.1-opcache \
	php8.1-soap php8.1-zip php8.1-redis php8.1-intl  php8.1-bcmath -y


RUN \
    --mount=type=cache,target=/var/cache/apt \
         apt install nginx -y

# Install Composer
RUN           php -r "readfile('http://getcomposer.org/installer');" > composer-setup.php && \
              php composer-setup.php --install-dir=/usr/bin --filename=composer && \
              php -r "unlink('composer-setup.php');"

# apt install php8.1 -y

ENV           WEBDAV_USERNAME admin
ENV           WEBDAV_PASSWORD admin


#WORKDIR /repos/dav
#RUN git clone https://github.com/sabre-io/dav.git .
#WORKDIR /repos/docker
#RUN git clone https://github.com/oliver-la/docker-nginx-webdav.git .

WORKDIR /var/webdav
RUN composer require sabre/dav ~4.3.1

# Defaults
WORKDIR       /var/webdav
VOLUME        /var/webdav/public
VOLUME        /var/webdav/data


# Set up entrypoint
COPY          scripts/install.sh /install.sh

# Configure nginx
COPY          config/nginx/default /etc/nginx/sites-enabled/default
COPY          config/nginx/fastcgi_params /etc/nginx/fastcgi_params

# forward request and error logs to docker log collector
RUN           ln -sf /dev/stdout /var/log/nginx/access.log && \
              ln -sf /dev/stderr /var/log/nginx/error.log

# copy server.php for client -- sabredav communication
#V1 COPY          web/server.php /var/webdav/server.php
COPY 		web/server4.php /var/webdav/server.php

#v1 CMD           /install.sh && service php5-fpm start && nginx -g "daemon off;"
CMD 		/install.sh && service php8.1-fpm start && nginx -g "daemon off;"

