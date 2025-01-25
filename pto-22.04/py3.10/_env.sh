
#source _env.sh from ../_env.sh making sure it relative to this script (not the calling script))
#echo "Context dir: $context_dir"
#if [ -e $context_dir/../_env.sh ]; then
#    source $context_dir/../_env.sh
#else
#    echo "ERROR: _env.sh not found in $context_dir/../"
#    
#fi
. /a/src/ubuntu/pto-22.04/_env.sh|| $srcroot/ubuntu/pto-22.04/_env.sh

export PY_VER_BASE=3.10
export PY_VER_BUMP=16
export PY_VER=${PY_VER_BASE}.${PY_VER_BUMP}
export dockertag4=jgwill/ubuntu:py${PY_VER_BASE}
export dockertag3=jgwill/ubuntu:py
export dockertag2=jgwill/ubuntu:$UBUNTU_VER-py$PY_VER_BASE-base-lzma
export dockertag1=jgwill/ubuntu:$UBUNTU_VER-py$PY_VER_BASE-base
export dockertag=jgwill/ubuntu:$UBUNTU_VER-py-base-${PY_VER}

TZ_NAME="America/New_York"

export DK_BUILD_ARGS="--build-arg PY_VER_BASE=$PY_VER_BASE --build-arg PY_VER=$PY_VER --build-arg UBUNTU_VER=$UBUNTU_VER --build-arg TZ_NAME=$TZ_NAME"

unset DOCKER_BUILDKIT

dkbuildprebuildscript=dkbuildprebuildscript.sh
dkbuildbuildsuccessscript=dkbuildbuildsuccessscript.sh
dkbuildfailedscript=dkbuildfailedscript.sh
dkbuildpostbuildscript=dkbuildpostbuildscript.sh

