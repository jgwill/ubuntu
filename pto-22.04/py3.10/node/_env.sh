
#source _env.sh from ../_env.sh making sure it relative to this script (not the calling script))
#echo "Context dir: $context_dir"
#if [ -e $context_dir/../_env.sh ]; then
#    source $context_dir/../_env.sh
#else
#    echo "ERROR: _env.sh not found in $context_dir/../"
#    
#fi
. /a/src/ubuntu/pto-22.04/_env.sh|| $srcroot/ubuntu/pto-22.04/_env.sh


#export dockertag2=jgwill/ubuntu:$UBUNTU_VER-node-2404
export dockertag1=jgwill/ubuntu:py-node
export dockertag2=jgwill/ubuntu:node-py
export dockertag=jgwill/ubuntu:22-py-node

export TZ_NAME="America/New_York"

export DK_BUILD_ARGS="--build-arg  UBUNTU_VER=$UBUNTU_VER --build-arg TZ_NAME=$TZ_NAME "

unset DOCKER_BUILDKIT

dkbuildprebuildscript=dkbuildprebuildscript.sh
dkbuildbuildsuccessscript=dkbuildbuildsuccessscript.sh
dkbuildfailedscript=dkbuildfailedscript.sh
dkbuildpostbuildscript=dkbuildpostbuildscript.sh

