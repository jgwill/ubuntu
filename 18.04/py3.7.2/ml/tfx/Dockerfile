# syntax=jgwill/dev:dockerfile-1.4

FROM jgwill/ubuntu:18.04-py3.7.2-ml-lzma



#Migrated to parent
# RUN pip3.10 install ipykernel


#@STCIssue I dont think I need this for TFX
#RUN echo "deb http://storage.googleapis.com/tensorflow-serving-apt stable tensorflow-model-server tensorflow-model-server-universal" |  tee /etc/apt/sources.list.d/tensorflow-serving.list && \
#curl https://storage.googleapis.com/tensorflow-serving-apt/tensorflow-serving.release.pub.gpg |  apt-key add -
#RUN apt update

RUN \
    --mount=type=cache,target=/root/.cache \
	 pip3.10 install -U tfx

#Required by TradingGym 2210
RUN \
    --mount=type=cache,target=/root/.cache \
	pip3.10 install tables networkx kaleido
#RUN pip3.10 install networkx
#RUN pip3.10 install trading_env


#RUN pip3.10 install --upgrade pip
#RUN pip3.10 install kaleido

#@STCIssue I guess they are included in above tfx
#RUN apt  install tensorflow-model-server -y
#RUN pip3.10 install keras ipykernel
#RUN pip3.10 install tensorflow
WORKDIR /work

#RUN pip3.10 install tapy
RUN \
    --mount=type=cache,target=/root/.cache \
	pip3.10 install backtrader yfinance
RUN \
    --mount=type=cache,target=/root/.cache \
	pip3.10 install tensorflow_decision_forests wurlitzer
#RUN pip install google.colab
WORKDIR /work

