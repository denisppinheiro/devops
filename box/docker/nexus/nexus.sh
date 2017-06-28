#!/usr/bin/env bash

echo "DevOps Box: provisioning Nexus"

if ! [ $(sudo docker restart nexus) ]; then

	docker run -d -p 9380:8081 --name nexus -v /vagrant/docker/nexus/.box/nexus-data:/nexus-data sonatype/nexus3
	
else

	echo "DevOps Box: Nexus already provisioned!"
	
fi