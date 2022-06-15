FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive

  # DEBIAN_FRONTEND=noninteractive TZ="America/New_York" apt-get -y install tzdata && \
RUN apt update && \
  DEBIAN_FRONTEND=noninteractive  apt-get -y install tzdata && \
 	apt upgrade -y && \
  apt -y install vim git curl && \
  apt install -y wget bzip2 && \
  apt install -y sudo && \
  apt install ffmpeg libimage-exiftool-perl -y && \
	apt clean && \
	rm -rf /var/lib/apt/lists/*




# Add user ubuntu with no password, add to sudo group
#@urir http://www.science.smith.edu/dftwiki/index.php/Tutorial:_Docker_Anaconda_Python_--_4
#RUN adduser --disabled-password --gecos '' ubuntu
#RUN adduser ubuntu sudo
#RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
#USER ubuntu
#WORKDIR /home/ubuntu/
#RUN chmod a+rwx /home/ubuntu/


USER root


#@STCGoal Compatible with dkbuilduser (using UID 1000)
#@STCIssue Generalize using dkrun "whoami" in the dkbuilduser
#RUN usermod -u 1002 ubuntu 
#&& chown -R 1002 /home/ubuntu


#RUN sudo echo "America/New_York" > /etc/timezone
#RUN sudo dpkg-reconfigure -f noninteractive tzdata

#RUN apt install -y xterm

#RUN DEBIAN_FRONTEND=noninteractive TZ="America/New_York" apt-get -y install tzdata
