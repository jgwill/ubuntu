
#source _env.sh from ../_env.sh making sure it relative to this script (not the calling script))
#echo "Context dir: $context_dir"
#if [ -e $context_dir/../_env.sh ]; then
#    source $context_dir/../_env.sh
#else
#    echo "ERROR: _env.sh not found in $context_dir/../"
#fi
PY_VERSION_BASE=3.10
. /a/src/ubuntu/pto-22.04/py$PY_VERSION_BASE/_env.sh|| $srcroot/ubuntu/pto-22.04/py$PY_VERSION_BASE/_env.sh

# The source image to build from 
export DK_TAG=jgwill/ubuntu:$UBUNTU_VER-py$PY_VER-slim

export dockertag2=jgwill/ubuntu:$UBUNTU_VER-py$PY_VER_BASE-lzma-slim-node
export dockertag1=jgwill/ubuntu:$UBUNTU_VER-py$PY_VER_BASE-slim-node
export dockertag3=guillaumeai/server:ubuntu-$UBUNTU_VER-py$PY_VER_BASE-slim-node
export dockertag4=jgwill/ubuntu:py$PY_VER-slim-node
export dockertag=jgwill/ubuntu:$UBUNTU_VER-py-${PY_VER}-slim-node

export DK_BUILD_ARGS=" --build-arg DK_TAG=$DK_TAG "

#export DK_BUILD_ARGS="--build-arg PY_VER_BASE=$PY_VER_BASE --build-arg PY_VER=$PY_VER --build-arg UBUNTU_VER=$UBUNTU_VER --build-arg TZ_NAME=$TZ_NAME "


#echo "DK_TAG=$DK_TAG"
#sleep 33

dkbuildprebuildscript=dkbuildprebuildscript.sh
dkbuildbuildsuccessscript=dkbuildbuildsuccessscript.sh
dkbuildfailedscript=dkbuildfailedscript.sh
dkbuildpostbuildscript=dkbuildpostbuildscript.sh
