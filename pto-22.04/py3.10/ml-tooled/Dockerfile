
FROM jgwill/ubuntu:py-node

ARG pip_cur=pip3.10
ARG nodeversion=20.x


        #apt update && apt install -y nodejs ;else cp "nodesource_setup.sh" /tmp;fi
WORKDIR /work


RUN \
    --mount=type=cache,target=/var/cache/apt \
	apt update && \
	apt upgrade -y

RUN \
    --mount=type=cache,target=/var/cache/apt \
	apt install -y libfreetype6-dev graphviz default-jre ant



RUN \
    --mount=type=cache,target=/root/.cache \
         pip install -U pip wheel setuptools


#for Adding indicators 
##@URIR https://technical-analysis-library-in-python.readthedocs.io/en/latest/index.html
##@URIR https://python.plainenglish.io/a-simple-guide-to-plotly-for-plotting-financial-chart-54986c996682
WORKDIR /repos
#COPY requirements.txt .
#RUN \
#    --mount=type=cache,target=/root/.cache \
#	pip install -r requirements.txt



RUN echo "update-250124">> /_updated.txt

# Code Server
RUN \
    --mount=type=cache,target=/root/.cache \
	curl -fsSL https://code-server.dev/install.sh | sh

# #TODO Install the Extension in here
# WORKDIR /svr/code-server/code-server-ext
# COPY code-server-ext .

# #DISABLED because they are by userI
# RUN ls *vsix &>/dev/null && for x in $(ls *vsix) ;do   echo "Installing $x";/usr/bin/code-server --install-extension /admin  "$x"; done && echo "Installed code-server extensions..." > ../log-dkbuild.txt ||  echo "Failed code-server extensions installation..." > ../log-dkbuild.txt
# WORKDIR /svr/code-server
# RUN rm -rf code-server-ext && \
# 	cp ~/.config/code-server/config.yaml .
# #RUN for x in $(code-server --list-extensions);do code-server --install-extension /admin $x --force;done

WORKDIR /opt
COPY run_code_server.sh run_kada_server.sh

RUN cp run_kada_server.sh run_code_server.sh && \ 
	chmod a+x run_kada_server.sh run_code_server.sh


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

#RUN pip install -U pip wheel setuptools

#RUN \
#    --mount=type=cache,target=/var/cache/apt \
#	apt install python3-urllib3 python3-requests ssh-import-id  libc6-dbg -y


RUN \
    --mount=type=cache,target=/root/.npm \
        npm install npm yarn @angular/cli --g

WORKDIR /tmp
RUN \
    --mount=type=cache,target=/root/.npm \
	ng new my-app --defaults && rm -rf my-app

WORKDIR /svr/code-server

#RUN for x in $(code-server --list-extensions);do code-server --install-extension /admin $x --force;done
#RUN cp ~/.config/code-server/config.yaml .
WORKDIR /work

#@STCIssue tfx not supporting python 3.10
#@STCGoal Installed python package other than tfx we require
RUN \
    --mount=type=cache,target=/root/.cache \
 	pip install python-dotenv kaleido mplfinance 

RUN \
    --mount=type=cache,target=/root/.cache \
        pip install scikit-learn shell-genie seaborn Sphinx poetry html2text dropbox fastapi_poe openai 

RUN \
    --mount=type=cache,target=/var/cache/apt \
        DEBIAN_FRONTEND=noninteractive apt update && apt install -y luarocks python3-urllib3 python3-requests ssh-import-id  libc6-dbg && \
         luarocks install http && \
	 luarocks install LuaFileSystem

RUN \
    --mount=type=cache,target=/var/cache/apt \
        apt update &&        apt -y install apt-transport-https ca-certificates gnupg curl
RUN \
    --mount=type=cache,target=/root/.cache \
        pip install google-cloud-aiplatform

#RUN \
#    --mount=type=cache,target=/var/cache/apt \
#        apt -y install apt-transport-https ca-certificates gnupg curl


RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg && echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

RUN \
 --mount=type=cache,target=/var/cache/apt \
        apt update && apt install google-cloud-cli -y \
        && apt autoremove -y

#RUN npm i tlid --g

