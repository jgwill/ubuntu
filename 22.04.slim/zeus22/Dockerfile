
FROM jgwill/ubuntu:22.04-slim


ARG DEBIAN_FRONTEND=noninteractive




RUN \
    --mount=type=cache,target=/var/cache/apt \
	DEBIAN_FRONTEND=noninteractive  apt -y install \
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
    
#RUN \
#    --mount=type=cache,target=/var/cache/apt \
#    apt install mssql-tools18 unixodbc-dev -y

RUN echo "2" > /tmp/_dev_answer && echo " " > /tmp/_dev_answer
RUN /opt/mssql/bin/mssql-conf set-edition</tmp/_dev_answer &>/dev/null  && /opt/mssql/bin/mssql-conf set EULA accepteulaml Y

#RUN /opt/mssql/bin/mssql-conf set EULA accepteulaml Y

#&& apt-get install -y mssql-server

RUN curl https://packages.microsoft.com/keys/microsoft.asc | tee /etc/apt/trusted.gpg.d/microsoft.asc

RUN curl https://packages.microsoft.com/config/ubuntu/22.04/prod.list |  tee /etc/apt/sources.list.d/mssql-release.list

RUN \
    --mount=type=cache,target=/var/cache/apt \
    apt update  && apt install -y  unixodbc-dev
