docker run -d --name machine5  devday/ansible-vm
docker run -d --name machine1  -p 5001:80 --link machine5:logserver devday/ansible-vm
docker run -d --name machine2  -p 5002:80 --link machine5:logserver devday/ansible-vm
docker run -d --name machine3  -p 5003:80 --link machine5:logserver devday/ansible-vm
docker run -d --name machine4  -p 5004:80 --link machine5:logserver devday/ansible-vm

docker run -it --rm --name ansible -v `pwd`/devday-ansible-master/playbooks:/data --link machine1:machine1 --link machine2:machine2 --link machine3:machine3 --link machine4:machine4 --link machine5:machine5 devday/ansible-master
