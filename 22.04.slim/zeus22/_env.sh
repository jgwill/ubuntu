ctlid=2403191028
dockertag=jgwill/server:mssql-22.04-slim

containername=mssql22slim
dkhostname=$containername

# PORT
dkport=1433:1433

xmount=/var/lib/mssql:/var/lib/mssql
xmount2=/opt/binscripts:/opt/binscripts


dkcommand=bash #command to execute (default is the one in the dockerfile)


#@STCIssue for more see: https://learn.microsoft.com/en-us/sql/sql-server/install/configure-the-windows-firewall-to-allow-sql-server-access?view=sql-server-ver16
_svc_broker=" -p 4022:4022 "
_https_auth=" -p 1443:443 "
_transac_sql_and_integration_svc=" -p 1135:135 " #TSQL and The Integration Services service uses DCOM on port 135. The Service Control Manager uses port 135 to do tasks such as starting and stopping the Integration Services service and transmitting control requests to the running service. The port number can't be changed.

_analysis_svc=" -p 2383:2383 " #The standard port for the default instance of Analysis Services.
_sql_browser=" -p 2382:2382 " #Client connection requests for a named instance of Analysis Services that don't specify a port number are directed to port 2382, the port on which SQL Server Browser listens. SQL Server Browser then redirects the request to the port that the named instance uses.
_web_port=" -p 1080:80 " #web port
dkextra=" -p 1434:1434 $_https_auth $_svc_broker $_transac_sql_and_integration_svc "
#dkextra=" -v \$dworoot/x:/x -p 2288:2288 "

#dkmounthome=true


##########################
############# RUN MODE
#dkrunmode="bg" #default fg
#dkrestart="--restart" #default
#dkrestarttype="unless-stopped" #default


#########################################
################## VOLUMES
#dkvolume="myvolname220413:/app" #create or use existing one
#dkvolume="$containername:/app" #create with containername name



#dkecho=true #just echo the docker run


# Use TZ
#DK_TZ=1



#####################################
#Build related
#
##chg back to that user
#dkchguser=vscode

######################## HOOKS BASH
### IF THEY EXIST, THEY are Executed, you can change their names

dkbuildprebuildscript=dkbuildprebuildscript.sh
dkbuildbuildsuccessscript=dkbuildbuildsuccessscript.sh
dkbuildfailedscript=dkbuildfailedscript.sh
dkbuildpostbuildscript=dkbuildpostbuildscript.sh

###########################################
# Unset deprecated
unset DOCKER_BUILDKIT

