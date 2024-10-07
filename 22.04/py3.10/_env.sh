
#export PY_VER_BASE=3.10
#export PY_VER=${PY_VER_BASE}.14
. base/_env.sh # get the PY_VER from the base env
export dockertag2=jgwill/ubuntu:22.04-py$PY_VER_BASE-lzma
export dockertag1=jgwill/ubuntu:22.04-py$PY_VER_BASE
export dockertag=jgwill/ubuntu:22.04-py-${PY_VER}

export DK_BUILD_ARGS="--build-arg PY_VER_BASE=$PY_VER_BASE --build-arg PY_VER=$PY_VER "



dkbuildprebuildscript=dkbuildprebuildscript.sh
dkbuildbuildsuccessscript=dkbuildbuildsuccessscript.sh
dkbuildfailedscript=dkbuildfailedscript.sh
dkbuildpostbuildscript=dkbuildpostbuildscript.sh
