. _env.sh
docker build -t $dockertag . $1 && \
docker push $dockertag && \
export tlidtag=$(tlid) && \
docker build -t jgwill/ubuntu:$tlidtag . && \
docker push jgwill/ubuntu:$tlidtag && \
docker build -t jgwill/ubuntu:latest . && \
docker push jgwill/ubuntu:latest
