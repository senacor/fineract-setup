#!/bin/bash
dockerTagPrefix=$1

#Building docker containers microservices
microservices=("accounting" "portfolio" "office" "customer" "identity" "provisioner")
for ms in "${microservices[@]}"
do
    echo Building docker container $ms
    cd $ms
    docker build -t $dockerTagPrefix/$ms . 
    cd ..
done