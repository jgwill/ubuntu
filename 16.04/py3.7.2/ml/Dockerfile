FROM jgwill/ubuntu:16.04-py3.7.2-lzma

#USER ubuntu


RUN apt-get update && apt-get upgrade -y 

RUN apt-get install -y build-essential

RUN apt-get install -y gfortran libopenblas-dev liblapack-dev
RUN apt-get install -y pkg-config
RUN apt-get install -y wget
RUN apt-get install -y python3-setuptools

RUN pip3.7 install numpy

RUN pip3.7 install scipy
RUN pip3.7 install pandas
RUN pip3.7 install patsy
RUN pip3.7 install statsmodels
RUN apt-get install -y libfreetype6-dev; \
	pip3.7 install matplotlib
RUN pip3.7 install ws4py
RUN pip3.7 install tornado
RUN pip3.7 install tweepy
RUN pip3.7 install cython
RUN pip3.7 install retrying
RUN apt-get -y install make cmake 

#RUN pip install --upgrade pip

RUN pip3.7 install pyodbc
RUN pip3.7 install sklearn

#USER root

