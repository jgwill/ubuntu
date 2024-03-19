
#FROM jgwill/ubuntu:18.04-py3.10.11-lzma
FROM jgwill/ubuntu:20.04-py3.10.11-lzma



# RUN \
#     --mount=type=cache,target=/root/.cache \
#        pip install --upgrade pip



        





# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN groupadd -r mysql && useradd -r -g mysql mysql

RUN \
    --mount=type=cache,target=/var/cache/apt \
        DEBIAN_FRONTEND=noninteractive apt update && \
        apt install -y --no-install-recommends gnupg 
        

# add gosu for easy step-down from root
# https://github.com/tianon/gosu/releases
ENV GOSU_VERSION 1.16
RUN \
    --mount=type=cache,target=/var/cache/apt \
    set -eux; \
	savedAptMark="$(apt-mark showmanual)"; \
	apt update
RUN \
    --mount=type=cache,target=/var/cache/apt \
    DEBIAN_FRONTEND=noninteractive \
    apt install -y --no-install-recommends ca-certificates wget; \
	dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')"; \
	wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch"; \
	wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc"; \
	export GNUPGHOME="$(mktemp -d)"; \
	gpg --batch --keyserver hkps://keys.openpgp.org --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4; \
	gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu; \
	gpgconf --kill all; \
	rm -rf "$GNUPGHOME" /usr/local/bin/gosu.asc; \
	apt-mark auto '.*' > /dev/null; \
	[ -z "$savedAptMark" ] || apt-mark manual $savedAptMark > /dev/null; \
	apt purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
	chmod +x /usr/local/bin/gosu; \
	gosu --version; \
	gosu nobody true

RUN mkdir /docker-entrypoint-initdb.d
RUN \
    --mount=type=cache,target=/var/cache/apt \
    DEBIAN_FRONTEND=noninteractive \
    set -eux; \
	apt update
RUN \
    --mount=type=cache,target=/var/cache/apt \
    DEBIAN_FRONTEND=noninteractive \
	apt install -y --no-install-recommends \
		bzip2 \
		openssl \
# FATAL ERROR: please install the following Perl modules before executing /usr/local/mysql/scripts/mysql_install_db:
# File::Basename
# File::Copy
# Sys::Hostname
# Data::Dumper
		perl \
		xz-utils \
		zstd
    #     \
	# ; \
	# rm -rf /var/lib/apt/lists/*
RUN \
    --mount=type=cache,target=/var/cache/apt \
    DEBIAN_FRONTEND=noninteractive \
    apt update && apt install gpg  -y

RUN \
    --mount=type=cache,target=/var/cache/apt \
    DEBIAN_FRONTEND=noninteractive \
    set -eux
# gpg: key 3A79BD29: public key "MySQL Release Engineering <mysql-build@oss.oracle.com>" imported
RUN \
    --mount=type=cache,target=/var/cache/apt \
    DEBIAN_FRONTEND=noninteractive \
	key='859BE8D7C586F538430B19C2467B942D3A79BD29'&& \
	export GNUPGHOME="$(mktemp -d)"&& \
	gpg --batch --keyserver keyserver.ubuntu.com --recv-keys "$key"&& \
	mkdir -p /etc/apt/keyrings&& \
	gpg --batch --export "$key" > /etc/apt/keyrings/mysql.gpg&& \
	gpgconf --kill all&& \
	rm -rf "$GNUPGHOME"

ENV MYSQL_MAJOR 8.0
ENV MYSQL_VERSION 8.0.33-1debian11

RUN \
    --mount=type=cache,target=/var/cache/apt \
    DEBIAN_FRONTEND=noninteractive \
    echo 'deb [ signed-by=/etc/apt/keyrings/mysql.gpg ] http://repo.mysql.com/apt/debian/ bullseye mysql-8.0' > /etc/apt/sources.list.d/mysql.list

# the "/var/lib/mysql" stuff here is because the mysql-server postinst doesn't have an explicit way to disable the mysql_install_db codepath besides having a database already "configured" (ie, stuff in /var/lib/mysql/mysql)
# also, we set debconf keys to make APT a little quieter
RUN { \
		echo mysql-community-server mysql-community-server/data-dir select ''; \
		echo mysql-community-server mysql-community-server/root-pass password ''; \
		echo mysql-community-server mysql-community-server/re-root-pass password ''; \
		echo mysql-community-server mysql-community-server/remove-test-db select false; \
	} | debconf-set-selections 


# RUN \
#     --mount=type=cache,target=/var/cache/apt \
#     DEBIAN_FRONTEND=noninteractive \
# apt update \
#  	&& apt install -y mecab-ipadic-utf8 libgcc-6-dev libc6-dev
# RUN \
#     --mount=type=cache,target=/var/cache/apt \
#     DEBIAN_FRONTEND=noninteractive \
# apt update \
#  	&& apt install -y libgcc-8-dev libstdc++6-8-dbg

RUN \
    --mount=type=cache,target=/var/cache/apt \
    DEBIAN_FRONTEND=noninteractive \
	apt update \
	&& apt install -y \
		mysql-community-client="${MYSQL_VERSION}" \
		mysql-community-server-core="${MYSQL_VERSION}" \
	&& rm -rf /var/lib/mysql && mkdir -p /var/lib/mysql /var/run/mysqld \
	&& chown -R mysql:mysql /var/lib/mysql /var/run/mysqld \
# ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
	&& chmod 1777 /var/run/mysqld /var/lib/mysql

WORKDIR /
#usr/local/bin/

#VOLUME /var/lib/mysql

# Config files
COPY config/ /etc/mysql/
RUN chmod -R go-w /etc/mysql/*
COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/docker-entrypoint.sh /entrypoint.sh # backwards compat
ENTRYPOINT ["usr/local/bin/docker-entrypoint.sh"]

EXPOSE 3306 33060
CMD ["mysqld"]





# WORKDIR /install 



# WORKDIR /work


