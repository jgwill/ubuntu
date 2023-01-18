
EULA_STUFF="-e MSSQL_PID=Developer -e ACCEPT_EULA=Y -e ACCEPT_EULA_ML=Y "
ddir=/mnt/c/var/lib/mssql/data
mkdir -p $ddir
. .env
mlocation=/data

RUNMODE="run -d"
dockertag="docker.io/guillaumeai/server:mssql-mls-220312"

dockertag="docker.io/guillaumeai/server:zeuz"

dockertag="docker.io/guillaumeai/server:mssql-mls-220312-ssis"
dockertag="docker.io/guillaumeai/server:zeuz-mssql-ml-ubuntu-16.04-ssis"
dockertag="docker.io/guillaumeai/server:zeuz-mssql-ml-ubuntu-18.04-ssis-py3.7.2-lzma"

#@STCIssue Validate that this script is the one creating the initial layer see : C:\Caishen\Caishen\src\Caishen\Databases\SpiderDbDatabase\gia-mssql\ZEUS\Dockerfile  OR : C:\Caishen\Caishen\src\Caishen\SDS\OdinStrategyRunner\v2\zeusis\run-zeuz-220615.sh

dockertag=docker.io/jgwill/zeus:zeusis-v3-221203-jgi


# dockertag="docker.io/jgwill/zeus:zeuzis-2206150918"
containername=zeuzis

if [ "$1" == "--rm" ]; then docker rm -f $containername ;fi

MSSQL_PORTMAP="-p 1433:1433"
SSIS_PORTMAP="-p 3882:3882"

cmd="docker $RUNMODE $EULA_STUFF --name $containername \
     -e MSSQL_SA_PASSWORD="$SAPWD" \
     -v $ddir:$mlocation -v $(pwd):/work \
     $MSSQL_PORTMAP $SSIS_PORTMAP \
     $dockertag"

echo "$cmd"
$cmd

#jgwill/zeus:zeuz-2206150813 
