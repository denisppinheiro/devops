#!/usr/bin/env bash

echo "DevOps Box: provisioning Apache"

if ! [ $(sudo systemctl status apache2) ]; then

	sudo apt-get update -y
	sudo apt-get install -y apache2
	
	#sudo systemctl status apache2
	sudo systemctl stop apache2
	
	# enable apache modules
	sudo a2enmod proxy proxy_http

	# setup config files
	#if ! [ -L /etc/apache2 ]; then
	#  sudo mv /etc/apache2 /vagrant/apache/.box/config
	#  sudo rm -rf /etc/apache2
	#  sudo ln -fs /vagrant/apache/.box/config /etc/apache2
	#fi
	if ! [ -L /etc/apache2/apache2.conf ]; then
		sudo mv /etc/apache2/apache2.conf /etc/apache2/apache2.conf.bkp
		sudo ln -fs /vagrant/apache/apache2.conf /etc/apache2/apache2.conf
		
	fi

	# setup log files
	if ! [ -L /var/log/apache2 ]; then
	  sudo mv /var/log/apache2 /vagrant/apache/.box/log
	  sudo rm -rf /var/log/apache2
	  sudo ln -fs /vagrant/apache/.box/log /var/log/apache2
	fi

	# setup web content
	if ! [ -L /var/www ]; then
	  sudo mv /var/www /vagrant/apache/.box/www
	  sudo rm -rf /var/www
	  sudo ln -fs /vagrant/apache/.box/www /var/www
	fi
	
	# copy default apache config
	# redirecting localhost/gitlab > localhost:9180
	# redirecting localhost/jenkins > localhost:9280
    # redirecting localhost/nexus > localhost:9380
	# redirecting localhost/sonar > localhost:9480
	
	#sudo systemctl status apache2
	sudo systemctl start apache2
	
	# setup startup at boot
	sudo systemctl enable apache2
	sudo systemctl status apache2.service
else

	echo "DevOps Box: Apache already provisioned!"
	
fi


