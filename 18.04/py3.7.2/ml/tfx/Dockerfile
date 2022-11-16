FROM jgwill/ubuntu:18.04-py3.7.2-ml-lzma

RUN \
    --mount=type=cache,target=/var/cache/apt \
        DEBIAN_FRONTEND=noninteractive apt update && apt install -y luarocks && \
         luarocks install http


WORKDIR /repos/tfx
COPY requirements.txt .
RUN \
    --mount=type=cache,target=/root/.cache \
        pip install -r requirements.txt



