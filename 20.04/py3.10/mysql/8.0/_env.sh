ctlid=2306180301
export dockertag=jgwill/ubuntu:20.04-py3.10.11-lzma-mysql-8.0

containername=ubmysql-$ctlid-base
dkhostname=$containername

# PORT
dkport=3306:3306

#xmount=/tmp:/a/tmp
xmount2=/opt/mysqldata:/var/lib/mysql


dkcommand=bash #command to execute (default is the one in the dockerfile)
dkcommand=""
#dkcommand=mysqld #command to execute (default is the one in the dockerfile)
dkextra=" -e MYSQL_ROOT_PASSWORD=MyPassw0rd "
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

