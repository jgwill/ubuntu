FROM ubuntu:18.04


RUN apt update && \
  DEBIAN_FRONTEND=noninteractive TZ="America/New_York" apt-get -y install tzdata && \
 	apt upgrade -y && \
  apt -y install vim git curl && \
  apt install -y wget bzip2 && \
  apt install -y sudo && \
  apt install ffmpeg libimage-exiftool-perl -y && \
	apt clean && \
	rm -rf /var/lib/apt/lists/*


USER root

RUN apt update


#RUN apt install -y xterm

