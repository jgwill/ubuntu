# syntax=docker/dockerfile:1.2

FROM jgwill/ubuntu:18.04-py3.7.2-ml-lzma

RUN \
    --mount=type=cache,target=/var/cache/apt \
        DEBIAN_FRONTEND=noninteractive apt update && apt install -y luarocks python3-urllib3 python3-requests ssh-import-id  libc6-dbg && \
         luarocks install http


WORKDIR /repos/tfx
COPY requirements.txt .
RUN \
    --mount=type=cache,target=/root/.cache \
        pip install -U -r requirements.txt

RUN \
    --mount=type=cache,target=/root/.cache \
	pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cpu

#RUN \
#    --mount=type=cache,target=/var/cache/apt \
#        apt install python3-urllib3 python3-requests ssh-import-id  libc6-dbg -y


