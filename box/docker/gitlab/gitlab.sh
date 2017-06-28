#!/usr/bin/env bash

echo "DevOps Box: provisioning GitLab"

if ! [ $(sudo docker restart gitlab) ]; then
  
  sudo docker run --detach \
    --hostname gitlab.example.com \
    --publish 9143:443 --publish 9180:80 --publish 9122:22 \
    --name gitlab \
    --restart always \
    --volume /vagrant/docker/gitlab/.box/config:/etc/gitlab \
    --volume /vagrant/docker/gitlab/.box/logs:/var/log/gitlab \
    --volume /vagrant/docker/gitlab/.box/data:/var/opt/gitlab \
    gitlab/gitlab-ce:latest
	
else

	echo "DevOps Box: GitLab already provisioned!"
	
fi