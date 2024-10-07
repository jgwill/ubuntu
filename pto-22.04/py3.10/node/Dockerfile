ARG UBUNTU_VER=22.04
FROM jgwill/ubuntu:py
#jgwill/ubuntu:py
ARG TZ_NAME="America/New_York"

ENV DEBIAN_FRONTEND=noninteractive




RUN rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/${TZ_NAME} /etc/localtime

# node
RUN \
    --mount=type=cache,target=/var/cache/apt \
        DEBIAN_FRONTEND=noninteractive apt update && \
        apt install -y ca-certificates curl gnupg && \
        mkdir -p /etc/apt/keyrings && \
        curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key |  gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
RUN \
    --mount=type=cache,target=/var/cache/apt \
        echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list

RUN \
    --mount=type=cache,target=/var/cache/apt \
        DEBIAN_FRONTEND=noninteractive apt update && \
        apt install -y nodejs


RUN npm install -g npm
