FROM ubuntu:22.04
#docker pull ubuntu:22.04

RUN apt update && apt-get upgrade -y


RUN apt -y install vim
RUN apt -y install git


RUN apt install -y curl


# Adding wget and bzip2
RUN apt install -y wget bzip2


# Add sudo
RUN apt -y install sudo

# Add user ubuntu with no password, add to sudo group
#@urir http://www.science.smith.edu/dftwiki/index.php/Tutorial:_Docker_Anaconda_Python_--_4
#RUN adduser --disabled-password --gecos '' ubuntu
#RUN adduser ubuntu sudo
#RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
#USER ubuntu
#WORKDIR /home/ubuntu/
#RUN chmod a+rwx /home/ubuntu/


USER root

RUN apt update


RUN apt install -y xterm

