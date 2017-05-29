#!/bin/bash

# source: https://store.docker.com/editions/community/docker-ce-server-ubuntu

echo "##############################################"
echo "############## SETUP DOCKER REPO #############"
echo "##############################################"
sudo apt-get -y install \
  apt-transport-https \
  ca-certificates \
  curl

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"

sudo apt-get update

echo "##############################################"
echo "############### INSTALL DOCKER ###############"
echo "##############################################"
sudo apt-get -y install docker-ce

echo "##############################################"
echo "################ TEST  DOCKER ################"
echo "##############################################"
sudo docker run hello-world
