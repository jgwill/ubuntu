
export PY_VER_BASE=3.10
export PY_VER=${PY_VER_BASE}.14
export dockertag2=jgwill/ubuntu:22.04-py$PY_VER_BASE-base-lzma
export dockertag1=jgwill/ubuntu:22.04-py$PY_VER_BASE-base
export dockertag=jgwill/ubuntu:22.04-py-base-${PY_VER}

export DK_BUILD_ARGS="--build-arg PY_VER_BASE=$PY_VER_BASE --build-arg PY_VER=$PY_VER "

unset DOCKER_BUILDKIT

dkbuildprebuildscript=dkbuildprebuildscript.sh
dkbuildbuildsuccessscript=dkbuildbuildsuccessscript.sh
dkbuildfailedscript=dkbuildfailedscript.sh
dkbuildpostbuildscript=dkbuildpostbuildscript.sh

