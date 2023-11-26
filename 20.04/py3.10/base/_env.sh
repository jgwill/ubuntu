export dockertag=jgwill/ubuntu:20.04-py3.10.13-base-lzma

unset DOCKER_BUILDKIT

dkbuildprebuildscript=dkbuildprebuildscript.sh
dkbuildbuildsuccessscript=dkbuildbuildsuccessscript.sh
dkbuildfailedscript=dkbuildfailedscript.sh
dkbuildpostbuildscript=dkbuildpostbuildscript.sh

