FROM jgwill/ubuntu:18.04-py3.7.2-lzma

#USER ubuntu


RUN apt-get update 
#&& apt-get upgrade -y 

# RUN apt-get install -y build-essential

RUN apt-get install -y gfortran libopenblas-dev liblapack-dev
RUN apt-get install -y pkg-config
# RUN apt-get install -y wget
RUN apt-get install -y python3-setuptools

#RUN pip3 install --upgrade pip
#RUN pip3 install setuptools

#RUN apt-get -y install make cmake 

RUN pip3 install numpy

RUN pip3 install scipy
RUN pip3 install pandas
RUN pip3 install pandas_ta
RUN pip3 install patsy
RUN pip3 install statsmodels
RUN apt-get install -y libfreetype6-dev; \
	pip3 install matplotlib
RUN pip3 install ws4py
RUN pip3 install tornado
RUN pip3 install tweepy
RUN pip3 install cython
RUN pip3 install retrying

#RUN pip install --upgrade pip
#RUN pip3 install setuptools
#WORKDIR /tmp
#COPY pyodbc-4.0.32-cp37-cp37m-win_amd64.whl .
#RUN pip install ./pyodbc-4.0.32-cp37-cp37m-win_amd64.whl
#RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
#RUN curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
#RUN apt update
#RUN apt install msodbcsql17 -y
#RUN apt install python3.7-dev -y

#RUN apt install -y python3-setuptools

#RUN pip3 install pyodbc
RUN pip3 install sklearn

RUN apt remove -y  python3-setuptools

RUN apt install libboost-all-dev -y

RUN apt install cmake make -y



# ODBC FROM : 
##    https://docs.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server?view=sql-server-ver16#ubuntu18

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

RUN curl https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN  apt update
RUN ACCEPT_EULA=Y apt install -y msodbcsql18
# optional: for bcp and sqlcmd
RUN ACCEPT_EULA=Y apt install -y mssql-tools18
RUN echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc
#source ~/.bashrc
# optional: for unixODBC development headers
RUN  apt-get install -y unixodbc-dev

# WINDOWS ODBC: https://docs.microsoft.com/en-us/sql/connect/odbc/download-odbc-driver-for-sql-server?view=sql-server-ver16


#USER root

