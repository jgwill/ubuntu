ARG UBUNTU_VER=22.04
FROM jgwill/ubuntu:py-node
#jgwill/ubuntu:py
ARG TZ_NAME="America/New_York"

ENV DEBIAN_FRONTEND=noninteractive


RUN npm install -g flowise
RUN chmod -R 777 /usr/lib/node_modules/flowise/logs/

CMD ["npx", "flowise","start"]
