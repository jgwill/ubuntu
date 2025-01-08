
. _env.sh

mkdir -p build
if [ ! -e "jgw_optimize_docker_build.sh" ]; then 
	cp $binroot/jgw_optimize_docker_build.sh build
else
	cp jgw_optimize_docker_build.sh build
fi



