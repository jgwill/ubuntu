export dockertag=jgwill/ubuntu:18.04-py3.7.2-lzma-node-tooled
export containertag=ubpy37node16tooled


dkhostname=$containername

# PORT
dkport=4000:4000

xmount=/mnt/c/usr/src:/src
xmount2=/mnt/c/usr/src/irai:/app


dkcommand=bash #command to execute (default is the one in the dockerfile)

#dkextra=" -v \$dworoot/x:/x -p 2288:2288 "

#dkmounthome=true


##########################
############# RUN MODE
#dkrunmode="bg" #default fg
#dkrestart="--restart" #default
#dkrestarttype="unless-stopped" #default


#########################################
################## VOLUMES
dkvolume="irainodemodule:/app/node_modules" #create or use existing one
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

