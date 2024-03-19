FROM docker.io/jgwill/server:mssql-22.04



RUN \
    --mount=type=cache,target=/var/cache/apt \
    apt install mssql-server-extensibility libssl-dev -y

# done in the parent image
#RUN /opt/mssql/bin/mssql-conf set EULA accepteulaml Y

#@STCIssue is this the adequate R for the MSSQL ML ??
RUN \
    --mount=type=cache,target=/var/cache/apt \
    apt install r-base -y
