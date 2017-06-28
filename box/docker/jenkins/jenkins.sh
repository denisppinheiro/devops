#!/usr/bin/env bash

echo "DevOps Box: provisioning Jenkins"

if ! [ $(sudo docker restart jenkins) ]; then
  
	sudo docker run --name jenkins -p 9280:8080 -p 50000:50000 -v /vagrant/docker/jenkins/.box:/var/jenkins_home jenkins
	
else

	echo "DevOps Box: Jenkins already provisioned!"
	
fi