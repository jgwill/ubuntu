. _env.sh
docker build -t $containertag .
docker push $containertag
echo "------------------------------------------"
echo "Built and pushed docker pull $containertag"
echo "FROM $containertag"
echo "-----------------------------"
