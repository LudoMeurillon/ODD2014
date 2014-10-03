for index in 1 2 3 4 5
do
  echo "destroying machine$index"
	result=`sudo docker stop machine$index`
	result=`sudo docker rm machine$index`
done
