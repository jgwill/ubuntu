. _env.sh
docker build -t $dockertag .
docker push $dockertag
#

docker build -t $dockertag2 .
docker push $dockertag2

