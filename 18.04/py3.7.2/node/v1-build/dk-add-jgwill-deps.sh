#!/bin/bash

#cp ../ml/ls-npm.txt build
tdir="$(pwd)/build/pack"
mkdir -p "$tdir"
flist="$(pwd)/ls-npm.txt"
(cd "$tdir" && for p in $(cat "$flist" );do wget "$(npm v $p dist.tarball)";done && \
        mv {,angular-}$(ls cli-*tgz)  )
