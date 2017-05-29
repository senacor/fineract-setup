
# Setup of the Mifos/Fineract stack in the AWS cloud with docker containers

This guide provides instructions how to setup the Mifos/Fineract project in the AWS cloud using docker containers. 

Note: Fineract and Mifos basically refer to the same project. Mifos is the name of the original project. Fineract is the project's name within apache (Apache Fineract); it is based on the Mifos code-base.

The project can be found here:

* The idea: http://mifos.org/
* Mifos code-base: https://github.com/mifosio/
* Apache Fineract: http://fineract.apache.org/

It is quite complex to get the project running, as there are many dependencies to tools and libraries. Currently there is no complete setup guideline yet. That's why we decided to create a separate repo where we collect our setup experiences and provide guidelines for a complete setup from scratch. 

Note: We performed the setup in an Ubuntu VM. All scripts and instructions provided thus refer to  Ubuntu.

## PreRequisits: 

Ubuntu 16.04 VM, 64bit (you can take a different version of linux, but at your own risk)
20 GB of VM disk space are sufficient

## Local Setup (Code & Build)

### Install Java 8 and IntelliJ IDEA

scripts/tools/install_Java_and_IDEA.sh
	
Script is base on: https://stackoverflow.com/questions/30130934/how-to-install-intellij-idea-on-ubuntu
We used the Edit2 version of the script on stackoverflow. You find the version we used in the  folder.

Note: The script will install JDK 8 (Oracle) for you as well (Java 8 section uncommented in script)!

Note: By default the script will install the community edition of IntelliJ IDEA. If you want to install the ultimate edition you can uncomment the block of the script that asks for the version to be installed (or just set the variable directly to U instead of C)!

### Install Maven

Note: Basically this step should not be needed, because a maven-wrapper should be enough. Due to certain 3rd party libraries (javamoney-lib) it is however needed to install maven at the moment.

scripts/tools/install_maven.sh
	
Script is base on: https://www.mkyong.com/maven/how-to-install-maven-in-ubuntu/

### Install Node.js + npm

Note: This is needed for the firms-web-app (the Angular UI that is provided in the fineract project).

scripts/tools/install_nodeJs.sh

Script is based on: https://nodejs.org/en/download/package-manager/

Node.js version 6.x will be installed by the script.

### Clone all repos and build the micro-services

The project has a micro-service architecture; the micro-services are represented by modules (see: https://www.jetbrains.com/help/idea/2017.1/about-modules.html).

Building all the different modules has to be done in a certain order, as several micro-services have dependencies on others. Thus, certain modules have to be available as dependencies to other modules. This is achieved by building the modules and storing them in the local maven-repository (more info on maven-local: https://www.mkyong.com/maven/where-is-maven-local-repository/).

In the demo-server module you find the script demo-server/scripts/Unix/initial-setup.sh (https://github.com/mifosio/demo-server/tree/develop/scripts/Unix). However, this script does not work as is, so we adapted it and provide a working version in the scripts folder.

1. Copy initial-project-setup-ubuntu.sh to an empty folder where you want to setup the project (the code).
2. Run script like this: initial-project-setup-ubuntu.sh mifosio

Note: mifosio as parameter defines the github-account to be used in the URL for pointing to the repos. 

The script will clone, build and publish (to maven-local) all the repos in the right order. The script will also create a certain folder structure for the project.

### Import code modules into IntelliJ IDEA

1. Startup IntelliJ IDEA
2. Open one of the modules (e.g. customer) as project
3. Import other modules by: New >> Open module from existing source

## Running the micro-services using Docker

### Install Docker (Community Edition):

scripts/tools/install_docker.sh

Script is based on: https://store.docker.com/editions/community/docker-ce-server-ubuntu 

(If the link above does not work you find a backup of the install instructions in the Backup folder.)

### Deployment to docker

IMPORTANT: Instructions not finished yet!

1. Retrieve docker containers: 
  activemq 
  eureka
  mysql
  cassandra 

## Utilizing the AWS cloud

### Deploymet to AWS-Cloud

IMPORTANT: Instructions not finished yet! 

1. Make the docker-containers available in a docker registry (e.g. docker-hub)
2. Configure the AWS Task-Definition so the right docker images are pulled
