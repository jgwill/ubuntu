FROM ubuntu

RUN apt-get update && apt-get upgrade -y


RUN apt-get -y install vim
RUN apt-get -y install git


RUN apt-get install -y curl


# Adding wget and bzip2
RUN apt-get install -y wget bzip2


# Add sudo
RUN apt-get -y install sudo

# Add user ubuntu with no password, add to sudo group
#@urir http://www.science.smith.edu/dftwiki/index.php/Tutorial:_Docker_Anaconda_Python_--_4
RUN adduser --disabled-password --gecos '' ubuntu
RUN adduser ubuntu sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER ubuntu
WORKDIR /home/ubuntu/
RUN chmod a+rwx /home/ubuntu/


USER root

RUN apt-get update


RUN apt-get install -y xterm

