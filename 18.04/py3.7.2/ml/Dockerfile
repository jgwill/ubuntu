# syntax=jgwill/dev:dockerfile-1.4

FROM jgwill/ubuntu:18.04-py3.7.2-lzma
ARG pip_parent=pip3.7
ARG pip_cur=pip3.10
ARG nodeversion=16.x

#USER ubuntu
#WORKDIR /__jgwillinstall
#COPY build/jgw_optimize_docker_build.sh .
#RUN bash jgw_optimize_docker_build.sh
WORKDIR /root

#RUN mkdir /__jgwill && mv /etc/apt/apt.conf.d/docker-clean /__jgwill
RUN \
    --mount=type=cache,target=/var/cache/apt \
    apt update  && \
	apt install -y	gcc g++ 

#&& apt upgrade -y 

# RUN apt install -y build-essential

# RUN apt install -y gfortran libopenblas-dev liblapack-dev
# RUN apt install -y pkg-config
# RUN apt install -y wget
#RUN apt install -y python3-setuptools # Maybe what I changed with unixodbc-dev for pyodbc worked

#RUN $pip_cur install --upgrade pip
#RUN $pip_cur install setuptools

#RUN apt -y install make cmake 
RUN \
    --mount=type=cache,target=/root/.cache \
	$pip_parent  install --upgrade pip





#USER root
#RUN apt update
RUN \
    --mount=type=cache,target=/var/cache/apt \
	curl -sL https://deb.nodesource.com/setup_$nodeversion -o /tmp/nodesource_setup.sh &&   bash /tmp/nodesource_setup.sh  && \ 
 	apt update && apt install -y nodejs 
#apt clean && \
#rm -rf /var/lib/apt/lists/*

#RUN --mount=type=cache,target=/root/.npm
#RUN --mount=type=cache,target=/root/.cache
#USER root

#RUN npm --version
RUN \
    --mount=type=cache,target=/root/.npm \
 	npm install npm --g && \
	npm install tlid droxul http-server --g
RUN \
    --mount=type=cache,target=/root/.npm \
	npm cache verify >> /npm-cache-verify.txt

#RUN npm install droxul --g
#RUN npm install http-server --g
RUN \
    --mount=type=cache,target=/root/.npm \
	npm i node-gyp --g && \
	npm i json2bash --g && \
	npm install typescript --g && \
	npm i thumbsup --g

RUN \
    --mount=type=cache,target=/root/.npm \
        npm cache verify >> /npm-cache-verify.txt

#@STCGoal Optimal and Fast Build
#@STCIssue Each time we change the parent, it takes a long time to reinstall
#RUN --mount=type=cache,target=/root/.cache
#RUN --mount=type=cache,target=/root/.npm


RUN --mount=type=cache,target=/root/.cache \
	du -ksh /root/.cache >> /duks_cache.txt



RUN --mount=type=cache,target=/root/.cache \
	$pip_cur install numpy scipy pandas pandas_ta patsy statsmodels sklearn

#RUN $pip_cur install scipy
#RUN $pip_cur install pandas
#RUN $pip_cur install pandas_ta
#RUN $pip_cur install patsy
#RUN $pip_cur install statsmodels
#RUN $pip_cur install --upgrade pip
RUN \
    --mount=type=cache,target=/var/cache/apt \
	apt install -y libfreetype6-dev graphviz default-jre

RUN --mount=type=cache,target=/root/.cache \
	$pip_cur install matplotlib && \
	$pip_cur install ws4py tornado tweepy cython retrying

#RUN $pip_cur install tornado
#RUN $pip_cur install tweepy
#RUN $pip_cur install cython
#RUN $pip_cur install retrying

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
#RUN $pip_cur install sklearn

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




RUN --mount=type=cache,target=/root/.cache \
        du -ksh /root/.cache >> /duks_cache.txt


# WINDOWS ODBC: https://docs.microsoft.com/en-us/sql/connect/odbc/download-odbc-driver-for-sql-server?view=sql-server-ver16

#RUN $pip_cur install sqlmlutils

# From Movie clustering
#RUN $pip_cur install seaborn surprise
#RUN $pip_cur install ast
RUN \
    --mount=type=cache,target=/root/.cache \
	$pip_cur install sqlmlutils nltk seaborn surprise pymssql

#RUN $pip_cur install seaborn
#RUN $pip_cur install surprise

#RUN python --version

#RUN $pip_cur install pymssql 



#for Adding indicators 
##@URIR https://technical-analysis-library-in-python.readthedocs.io/en/latest/index.html
##@URIR https://python.plainenglish.io/a-simple-guide-to-plotly-for-plotting-financial-chart-54986c996682
WORKDIR /repos
COPY requirements.txt .
RUN \
    --mount=type=cache,target=/root/.cache \
	pip install -r requirements.txt


RUN --mount=type=cache,target=/root/.cache \
        du -ksh /root/.cache >> /duks_cache.txt

#for TFX
#RUN \
#    --mount=type=cache,target=/root/.cache \
#	$pip_cur install pyyaml pandas-datareader ta && \
#	$pip_cur install -q requests
#RUN $pip_cur install pandas-datareader

#Serve notebooks
#RUN \
#    --mount=type=cache,target=/root/.cache \
#	$pip_cur  install ipykernel

# Code Server
#RUN curl -fsSL https://code-server.dev/install.sh | sh
#TODO Install the Extension in here



#221022 upgrade after mastering Python/DataPrep
#RUN \
#    --mount=type=cache,target=/root/.cache \
#	$pip_cur install plotly-express pyshp colorcet networkx
#RUN $pip_cur install seaborn
#RUN pip3.7 install  pyodbc urlopen colour plotly bokeh dropbox notebook ipywidgets

#RUN $pip_cur install pyshp colorcet networkx
#RUN $pip_cur install colorcet
#RUN $pip_cur install networkx
#RUN \
#    --mount=type=cache,target=/root/.cache \
#	$pip_cur install google.colab


WORKDIR /work


