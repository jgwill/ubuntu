

. _env.sh
docker tag $dockertag guillaumeai/zeus:dist-2301 && docker push $_
docker tag $dockertag guillaumeai/zeus && docker push $_
