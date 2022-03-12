. _env.sh
docker build -t $dockertag .
docker push $dockertag

export tlidtag=$(tlid)
docker build -t jgwill/ubuntu:$tlidtag .
docker push jgwill/ubuntu:$tlidtag

