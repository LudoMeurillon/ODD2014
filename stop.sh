for index in 1 2 3 4 5
do
  echo "destroying machine$index"
	result=`docker stop machine$index`
	result=`docker rm machine$index`
done
