#!/bin/bash

for index in 1 2 3 4 5
do
	name="MACHINE"$index"_PORT_22_TCP_ADDR"
	if [ ${!name} ]; then
	  echo "adding machine$index to /etc/hosts (${!name})"
	  echo "machine$index" >> /etc/ansible/hosts
	fi
done