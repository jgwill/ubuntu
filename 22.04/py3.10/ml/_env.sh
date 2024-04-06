export dockertag=jgwill/ubuntu:22.04-py3.10-ml-lzma
containername=ml
dkhostname=$containername


unset DOCKER_BUILDKIT

dkbuildprebuildscript=dkbuildprebuildscript.sh
dkbuildbuildsuccessscript=dkbuildbuildsuccessscript.sh
dkbuildfailedscript=dkbuildfailedscript.sh
dkbuildpostbuildscript=dkbuildpostbuildscript.sh

