#!/bin/bash

if [ ! -d /usr/local/docker ]; then
  echo "create /usr/local/docker"
  mkdir /usr/local/docker
fi
if [ ! -d /usr/local/docker ]; then
  echo "link /var/lib/docker to /usr/loca/docker"
  ln -sf /usr/local/docker /var/lib/docker
fi

export http_proxy=http://proxy:8080
export https_proxy=http://proxy:8080

pushd ~
git clone https://github.com/ludomeurillon/ODD2014.git
pushd ODD2014
git checkout -t origin/master
pushd install
sh install-docker-1.2.0-proxy.sh
popd
popd
popd
