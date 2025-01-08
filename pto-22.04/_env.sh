
export UBUNTU_VER_BASE=22
export UBUNTU_VER=$UBUNTU_VER_BASE'.04'
export dockertag=jgwill/ubuntu:$UBUNTU_VER
export dockertag2=jgwill/ubuntu:$UBUNTU_VER_BASE
export dockertag1=jgwill/ubuntu
export dockertag3=jgwill/ubuntu:latest
export containername=jgwillubuntu22


export DK_BUILD_ARGS=" --build-arg UBUNTU_VER_BASE=$UBUNTU_VER_BASE --build-arg UBUNTU_VER=$UBUNTU_VER "



dkbuildprebuildscript=dkbuildprebuildscript.sh
dkbuildbuildsuccessscript=dkbuildbuildsuccessscript.sh
dkbuildfailedscript=dkbuildfailedscript.sh
dkbuildpostbuildscript=dkbuildpostbuildscript.sh
