FROM jgwill/ubuntu:16.04-py3.7.2-lzma
ARG pip_parent=pip3.7
ARG pip_cur=pip3.10
ARG nodeversion=16.x

#USER ubuntu


RUN apt update 
#&& apt upgrade -y 

# RUN apt install -y build-essential

# RUN apt install -y gfortran libopenblas-dev liblapack-dev
# RUN apt install -y pkg-config
# RUN apt install -y wget
#RUN apt install -y python3-setuptools # Maybe what I changed with unixodbc-dev for pyodbc worked

#RUN $pip_cur install --upgrade pip
#RUN $pip_cur install setuptools

#RUN apt -y install make cmake 

RUN $pip_parent  install --upgrade pip





#USER root
#RUN apt update
RUN curl -sL https://deb.nodesource.com/setup_$nodeversion -o /tmp/nodesource_setup.sh &&   bash /tmp/nodesource_setup.sh  && \
 apt install -y nodejs && \
 apt clean && \
rm -rf /var/lib/apt/lists/*


#USER root

RUN npm --version

RUN npm install npm --g
RUN npm install tlid --g
RUN npm install droxul --g
RUN npm install http-server --g

RUN npm i node-gyp --g
RUN npm i json2bash --g
RUN npm install typescript --g
RUN npm i thumbsup --g




#







RUN $pip_cur install numpy

RUN $pip_cur install scipy
RUN $pip_cur install pandas
RUN $pip_cur install pandas_ta
RUN $pip_cur install patsy
RUN $pip_cur install statsmodels
RUN $pip_cur install --upgrade pip
RUN apt install -y libfreetype6-dev; \
	$pip_cur install matplotlib
RUN $pip_cur install ws4py
RUN $pip_cur install tornado
RUN $pip_cur install tweepy
RUN $pip_cur install cython
RUN $pip_cur install retrying

#RUN $pip_cur install setuptools
#WORKDIR /tmp
#COPY pyodbc-4.0.32-cp37-cp37m-win_amd64.whl .
#RUN pip install ./pyodbc-4.0.32-cp37-cp37m-win_amd64.whl
#RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
#RUN curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
#RUN apt update
#RUN apt install msodbcsql17 -y
#RUN apt install python3.7-dev -y

#RUN apt install -y python3-setuptools

#RUN $pip_cur install pyodbc
RUN $pip_cur install sklearn

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

RUN $pip_cur install sqlmlutils

# From Movie clustering
#RUN $pip_cur install seaborn surprise
#RUN $pip_cur install ast
RUN $pip_cur install nltk
RUN $pip_cur install seaborn
RUN $pip_cur install surprise

#RUN python --version

RUN $pip_cur install pymssql
RUN $pip_cur install forexconnect

RUN $pip_cur install pyalgotrade


#for Adding indicators 
##@URIR https://technical-analysis-library-in-python.readthedocs.io/en/latest/index.html
##@URIR https://python.plainenglish.io/a-simple-guide-to-plotly-for-plotting-financial-chart-54986c996682
RUN $pip_cur install ta


#for TFX
RUN $pip_cur install pyyaml 
RUN $pip_cur install -q requests
RUN $pip_cur install pandas-datareader

#Serve notebooks
RUN $pip_cur  install ipykernel

# Code Server
RUN curl -fsSL https://code-server.dev/install.sh | sh

RUN $pip_cur install fxcmpy

#221022 upgrade after mastering Python/DataPrep
RUN $pip_cur install plotly-express
RUN $pip_cur install seaborn


RUN $pip_cur install bokeh pyshp 
RUN $pip_cur install colorcet
RUN $pip_cur install networkx
RUN $pip_cur install colorcet


WORKDIR /work


