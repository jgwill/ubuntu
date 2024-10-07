FROM docker.io/jgwill/server:mssql-22.04-slim



RUN \
    --mount=type=cache,target=/var/cache/apt \
    apt install mssql-server-extensibility libssl-dev -y

# done in the parent image
#RUN /opt/mssql/bin/mssql-conf set EULA accepteulaml Y

# update indices
RUN \
    --mount=type=cache,target=/var/cache/apt \
    apt update -qq

# install two helper packages we need
RUN \
    --mount=type=cache,target=/var/cache/apt \
    apt install -y \
      --no-install-recommends \
      software-properties-common \
      dirmngr
# add the signing key (by Michael Rutter) for these repos
# To verify key, run gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc 
# Fingerprint: E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN \
    --mount=type=cache,target=/var/cache/apt \
  wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
# add the R 4.0 repo from CRAN -- adjust 'focal' to 'groovy' or 'bionic' as needed
RUN \
    --mount=type=cache,target=/var/cache/apt \
    add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"
RUN \
    --mount=type=cache,target=/var/cache/apt \
    apt update
#@STCIssue is this the adequate R for the MSSQL ML ??
# install R and littler
RUN \
    --mount=type=cache,target=/var/cache/apt \
    apt install -y r-base r-base-dev r-recommended littler
# RUN \
#     --mount=type=cache,target=/var/cache/apt \
#     apt install --no-install-recommends r-base
    
#@STCGoal R install
COPY install.R .
RUN R --save < install.R

COPY compat.R .
RUN R --save < compat.R


COPY verify.R .
RUN R --save < verify.R > verify.log

RUN cat verify.log 



#Configure R runtime with SQL Server
#@URIR https://learn.microsoft.com/en-us/sql/linux/sql-server-linux-setup-machine-learning-sql-2022?toc=%2Fsql%2Fmachine-learning%2Ftoc.json&view=sql-server-ver16#configure-r-runtime-with-sql-server

RUN /opt/mssql/bin/mssql-conf set extensibility rbinpath /usr/lib/R/bin/R
RUN /opt/mssql/bin/mssql-conf set extensibility datadirectories /usr/lib/R


ARG DEBIAN_FRONTEND=noninteractive

# copy in supervisord conf file
#COPY ./supervisord.conf /usr/local/etc/supervisord.conf

EXPOSE 1433
#EXPOSE 3882
# start services with supervisord
#CMD /usr/bin/supervisord -n -c /usr/local/etc/supervisord.conf

#RUN systemctl restart mssql-launchpadd.service

#tc/systemd/system/multi-user.target.wants/mssql-launchpadd.service → /lib/systemd/system/mssql-launchpadd.service.
#root@mssql22ml:~# systemctl start mssql-launchpadd.service
#System has not been booted with systemd as init system (PID 1). Can't operate.
#Failed to connect to bus: Host is down

#docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=<YourPassword>' -p 1433:1433 -d mcr.microsoft.com/mssql/server:2019-latest

#RUN /opt/mssql/bin/mssql-conf set-edition</tmp/_dev_answer &>/dev/null  && /opt/mssql/bin/mssql-conf set EULA accepteulaml Y

RUN echo "2" > /tmp/_dev_answer 
RUN echo " " >> /tmp/_dev_answer 

RUN echo '/opt/mssql/bin/mssql-conf set-edition</tmp/_dev_answer && /opt/mssql/bin/mssql-conf set EULA accepteulaml Y && /opt/mssql/bin/sqlservr --accept-eula' >> _run.sh

COPY sp_enable_script_verify.sql .
COPY sp_enable_script.sql .

#@STCIssue How to run that script in the container?
 
CMD /opt/mssql/bin/sqlservr --accept-eula
#CMD /opt/mssql/bin/mssql-conf set-edition</tmp/_dev_answer &>/dev/null  && /opt/mssql/bin/mssql-conf set EULA accepteulaml Y && /opt/mssql/bin/sqlservr
#CMD bash _run.sh
