#!/bin/bash

http_proxy=http://proxy:8080
https_proxy=http://proxy:8080
pwd=`pwd`
cd ~/ODD2014
./build.sh


#Prepare docker workshop
sudo docker pull ubuntu:14.04
sudo docker pull tutum/tomcat:7.0
sudo docker pull mysql:5.6
sudo docker pull registry:latest
sudo docker pull google/cadvisor:latest

cd ~/ODD2014
./build.sh
cd $pwd
