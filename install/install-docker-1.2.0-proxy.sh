# Check that HTTPS transport is available to APT
if [ ! -e /usr/lib/apt/methods/https ]; then
	apt-get update
	apt-get install -y apt-transport-https
fi

# Add the repository to your APT sources
echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list

# Then import the repository key
apt-key adv --keyserver-options http-proxy=http://proxy:8080 --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9

# Install docker
apt-get update
apt-get install -y lxc-docker

#
# Alternatively, just use the curl-able install.sh script provided at https://get.docker.io
#

\cp -f NetworkManager.conf /etc/NetworkManager/NetworkManager.conf
\cp -f docker-default /etc/default/docker

service network-manager restart
service docker restart
