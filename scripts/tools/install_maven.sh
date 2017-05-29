#!/bin/bash

# source: https://www.mkyong.com/maven/how-to-install-maven-in-ubuntu/

echo "##############################################"
echo "############### INSTALL MAVEN ################"
echo "##############################################"
apt-cache search maven
sudo apt-get install maven

echo "##############################################"
echo "############ TEST: MAVEN VERSION #############"
echo "##############################################"
mvn -version
