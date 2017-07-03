#!/usr/bin/env bash

echo "DevOps Box: provisioning Sonar"

if ! [ $(sudo docker restart sonar) ]; then

	#docker run -d -p 9480:8081 --name nexus -v /vagrant/docker/nexus/.box/nexus-data:/nexus-data sonatype/nexus3
	#docker run -d --name sonarqube -p 9000:9000 -p 9092:9092 -v /vagrant/docker/sonar/.box/sonar-source:/opt/sonar-source  sonarqube
	docker run -d --name sonarqube -p 9000:9000 -p 9092:9092 -v /vagrant/docker/sonar/.box/sonar-source:/opt/sonar-source  sonarqube
else

	echo "DevOps Box: Sonar already provisioned!"
	
fi