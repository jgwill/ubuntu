FROM jgwill/ubuntu:18.04-py3.7.2-lzma

#USER ubuntu


RUN apt update 
#&& apt upgrade -y 

# RUN apt install -y build-essential

# RUN apt install -y gfortran libopenblas-dev liblapack-dev
# RUN apt install -y pkg-config
# RUN apt install -y wget
#RUN apt install -y python3-setuptools # Maybe what I changed with unixodbc-dev for pyodbc worked

#RUN pip3.7 install --upgrade pip
#RUN pip3.7 install setuptools

#RUN apt -y install make cmake 

RUN pip3.7 install numpy

RUN pip3.7 install scipy
RUN pip3.7 install pandas
RUN pip3.7 install pandas_ta
RUN pip3.7 install patsy
RUN pip3.7 install statsmodels
RUN pip3.7 install --upgrade pip
RUN apt install -y libfreetype6-dev; \
	pip3.7 install matplotlib
RUN pip3.7 install ws4py
RUN pip3.7 install tornado
RUN pip3.7 install tweepy
RUN pip3.7 install cython
RUN pip3.7 install retrying

#RUN pip3.7 install setuptools
#WORKDIR /tmp
#COPY pyodbc-4.0.32-cp37-cp37m-win_amd64.whl .
#RUN pip install ./pyodbc-4.0.32-cp37-cp37m-win_amd64.whl
#RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
#RUN curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
#RUN apt update
#RUN apt install msodbcsql17 -y
#RUN apt install python3.7-dev -y

#RUN apt install -y python3-setuptools

#RUN pip3.7 install pyodbc
RUN pip3.7 install sklearn

#RUN apt remove -y  python3-setuptools

# RUN apt install libboost-all-dev -y

# RUN apt install cmake make -y



# ODBC FROM : 
##    https://docs.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server?view=sql-server-ver16#ubuntu18




# MAYBE ALL THIS CAN BE REMOVED 220809

# RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

# RUN echo "curl https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/prod.list"
# RUN curl https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/prod.list > /etc/apt/sources.list.d/mssql-release.list 
# RUN cat /etc/apt/sources.list.d/mssql-release.list 
# #RUN apt update
# RUN ACCEPT_EULA=Y apt install -y msodbcsql18
# # optional: for bcp and sqlcmd
# RUN ACCEPT_EULA=Y apt install -y mssql-tools18
# RUN echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc
#source ~/.bashrc
# optional: for unixODBC development headers
#RUN  apt install -y unixodbc-dev






# WINDOWS ODBC: https://docs.microsoft.com/en-us/sql/connect/odbc/download-odbc-driver-for-sql-server?view=sql-server-ver16

RUN pip3.7 install sqlmlutils
#USER root

