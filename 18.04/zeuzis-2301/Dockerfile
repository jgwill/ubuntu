# syntax=docker/dockerfile:1.2

# Maintainers: Microsoft Corporation , Jean-Guillaume Isabelle

#FROM jgwill/jgt:ubuntu-18.04-py3.7.2-ml-lzma-tfx-jgt
FROM guillaumeai/zeus:base-ubuntu-18.04-py3.7.2-ml-lzma-tfx-gi
#
ARG DEBIAN_FRONTEND=noninteractive

# copy in supervisord conf file
COPY ./supervisord.conf /usr/local/etc/supervisord.conf

# # install supporting packages (Included in jgwill/ubuntu:16.04)
# RUN apt-get update && \
#     apt-get install -y apt-transport-https \
#                        curl \
#                        supervisor \
#                        fakechroot \
#                        locales \
#                        iptables \
#                        sudo \
#                        wget \
#                        curl \
#                        zip \
#                        unzip \
#                        make \ 
#                        bzip2 \ 
#                        m4 \
#                        apt-transport-https \
#                        tzdata \
#                        libnuma-dev \
#                        libsss-nss-idmap-dev \
#                        software-properties-common

# Adding custom MS repository
RUN \
    --mount=type=cache,target=/var/cache/apt \
	curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
	curl https://packages.microsoft.com/config/ubuntu/18.04/mssql-server-2019.list > /etc/apt/sources.list.d/mssql-server-2019.list && apt update

RUN \
    --mount=type=cache,target=/var/cache/apt \ 
    DEBIAN_FRONTEND=noninteractive apt install -y mssql-mlservices-packages-r \
                       mssql-mlservices-packages-py 
    # Cleanup the Dockerfile
    #apt clean && \
    #rm -rf /var/apt/cache/* /tmp/* /var/tmp/* /var/lib/apt/lists
    
# Install mssql-cli
#RUN apt update && apt-get install mssql-cli -y

#SSIS
#RUN \
#    --mount=type=cache,target=/var/cache/apt \ 
#	DEBIAN_FRONTEND=noninteractive apt install -y mssql-server-is 
    # Cleanup the Dockerfile
    #apt clean && \
    #rm -rf /var/apt/cache/* /tmp/* /var/tmp/* /var/lib/apt/lists

#COPY ssis.conf /var/opt/ssis/ssis.conf


#Back to MSSQL stuff that seems to be required done after SSIS

# run checkinstallextensibility.sh
RUN /opt/mssql/bin/checkinstallextensibility.sh && \
    # set/fix directory permissions and create default directories
    chown -R root:root /opt/mssql/bin/launchpadd && \
    chown -R root:root /opt/mssql/bin/setnetbr && \
    mkdir -p /var/opt/mssql-extensibility/data && \
    mkdir -p /var/opt/mssql-extensibility/log && \
    chown -R root:root /var/opt/mssql-extensibility && \
    chmod -R 777 /var/opt/mssql-extensibility && \
    # locale-gen
    locale-gen en_US.UTF-8

# expose SQL Server port
EXPOSE 1433
RUN \
    --mount=type=cache,target=/var/cache/apt \
	apt install supervisor -y


#@STCIssue Python 3 can not make Suppervisord to work
RUN rm /usr/bin/python && ln -sf /usr/bin/python2.7 /usr/bin/python
RUN update-alternatives --install /usr/bin/python3 python3 /usr/local/bin/python3.7 1
RUN update-alternatives --install /usr/bin/pip3 pip3 /usr/local/bin/pip3.7 1
# start services with supervisord
CMD /usr/bin/supervisord -n -c /usr/local/etc/supervisord.conf
