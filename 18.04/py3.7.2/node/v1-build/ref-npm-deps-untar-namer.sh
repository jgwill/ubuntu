
srcdir=/work/build/pack;cdir=$(pwd);for p in $(cd $srcdir;ls *tgz);do pname=$(echo $p | sed 's/\.tgz//g') ;echo "$pname" ;tar  -xzf $srcdir/$p;mv package $pname &>/dev/null;pwd;ls;echo "----------------";cd $cdir;done

