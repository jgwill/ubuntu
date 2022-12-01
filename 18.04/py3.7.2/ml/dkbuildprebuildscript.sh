
mkdir -p build
if [ -e "$binroot/jgw_optimize_docker_build.sh" ];then cp $binroot/jgw_optimize_docker_build.sh build;fi


#Download Tarbal NPM
#for p in $(cat ../ls-npm.txt );do wget "$(npm v $p dist.tarball)";done

