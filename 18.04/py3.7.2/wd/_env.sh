#dockertag=jgwill/zeus:strategyrunner-2208-v2-prod

#dockertag=xama/nginx-webdav
dockertag=guillaumeai/server:webdavv2


containername=wd

dkhostname=$containername

# PORT

dkport=8080:80


# VOLUMES

#dkvolume="myvolname220413:/app" #create or use existing one 
#dkvolume="$containername:/app" #create with containername name

#dkecho=true #just echo the docker run

dkcommand=" "

#dkcommand="node server.js"


#command to execute (default is the one in the dockerfile)


#dkextra=" -p 8889:8899 -p 8888:8888 -p 88:88 -p 8080:8080 -v /a:/a -v /a/repos/pys:/p "
. .env

dkextra="  -e WEBDAV_USERNAME="$WEBDAV_USERNAME"  -e WEBDAV_PASSWORD="$WEBDAV_PASSWORD"   -v /a/repos/pys:/p  -v /a/repos:/var/webdav/public "


#dkmounthome=true

#/opt/StrategyRunner

xmount=/a:/a 
xmount2=/a/repos:/o

# Use TZ
#DK_TZ=1

# RUN MODE 
dkrunmode="bg" #default fg
dkrestart="--restart" #default
dkrestarttype="unless-stopped" #default



#####################################



#Build related



#

##chg back to that user

#dkchguser=vscode


