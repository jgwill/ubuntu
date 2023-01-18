export tlidtag=2301
#export dockertag="guillaumeai/server:zeuz-mssql-ml-ubuntu-18.04-ssis-py3.7.2-lzma-tfx-$tlidtag"
export dockertag="guillaumeai/server:zeuz-mssql-ml-ubuntu-18.04-py3.7.2-lzma-tfx-$tlidtag"

#guillaumeai/server:zeuz-mssql-ml-ubuntu-18.04-ssis-py3.7.2-lzma
export containername=zeuz-mssql-mls-$tlidtag
export containername=zeuzisV3
#zaml
export stcgoal="SSIS(removed, issue but also deprecating), SQL and SQL Server Machine Learning Services (Python and R) on Docker and have a fix for the MSSQLML Python install SQLMLUtils (LZMA)"

echo "see in : /c/Caishen/Caishen/src/Caishen/SDS/OdinStrategyRunner/v2/zeusis"
echo "          for zeuzis running"
echo "          then we commit the running using . wf-commit... in : /mnt/c/Caishen/Caishen/src/Caishen/Databases/SpiderDbDatabase/gia-mssql/ZEUS"


dkbuildprebuildscript=dkbuildprebuildscript.sh
dkbuildbuildsuccessscript=dkbuildbuildsuccessscript.sh
dkbuildfailedscript=dkbuildfailedscript.sh
dkbuildpostbuildscript=dkbuildpostbuildscript.sh

