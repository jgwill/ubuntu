export dockertag=jgwill/ubuntu:20.04
export containername=jgwillubuntu18
export cur_python="py3.10.10"



dkbuildprebuildscript=dkbuildprebuildscript.sh
dkbuildbuildsuccessscript=dkbuildbuildsuccessscript.sh
dkbuildfailedscript=dkbuildfailedscript.sh
dkbuildpostbuildscript=dkbuildpostbuildscript.sh

unset DOCKER_BUILDKIT

