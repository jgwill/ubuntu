cdir=$(pwd)
rm -rf build
mkdir -p build
#(cd ../ml/npm-packages/;tar cf - *tgz | (cd $cdir;mkdir -p build;cd build&&tar xvf -))
cp ../ml/ls-npm.txt build
#(cd build && mkdir -p pack && cd pack && for p in $(cat ../ls-npm.txt );do wget "$(npm v $p dist.tarball)";done && \
#	mv {,angular-}$(ls cli-*tgz)  )

#(cd build  && for p in $(cat ls-npm.txt );do pname=$(echo $p | sed 's/\//\-/g'| sed 's/@//g');echo "wget '$(npm v $p dist.tarball)' --quiet -O '$pname.tgz'";done > jgw-deps-downloder-url.sh  )
(cd build  && for p in $(cat ls-npm.txt );do pname=$(echo $p | sed 's/\//\-/g'| sed 's/@//g');echo "curl '$(npm v $p dist.tarball)' --silent | tar xzf - && (if [ -d package ];then mv package $pname &>/dev/null;fi)";done > jgw-deps-downloder-url.sh  )
