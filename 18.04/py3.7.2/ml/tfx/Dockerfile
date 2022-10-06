
FROM jgwill/ubuntu:18.04-py3.7.2-ml-lzma



#Migrated to parent
# RUN pip3.10 install ipykernel


#@STCIssue I dont think I need this for TFX
#RUN echo "deb http://storage.googleapis.com/tensorflow-serving-apt stable tensorflow-model-server tensorflow-model-server-universal" |  tee /etc/apt/sources.list.d/tensorflow-serving.list && \
#curl https://storage.googleapis.com/tensorflow-serving-apt/tensorflow-serving.release.pub.gpg |  apt-key add -
#RUN apt update

RUN pip3.10 install -U tfx


#@STCIssue I guess they are included in above tfx
#RUN apt  install tensorflow-model-server -y
#RUN pip3.10 install keras ipykernel
#RUN pip3.10 install tensorflow
WORKDIR /work


