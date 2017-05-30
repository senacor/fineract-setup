#!/bin/bash
dockerTagPrefix=$1

port=8081

#Building docker containers microservices
microservices=("identity" "office" "customer" "accounting" "portfolio" "provisioner")
for ms in "${microservices[@]}"
do
    if [ "$ms" == "provisioner" ] ; then
        port=9090
    fi
    cd $ms
    echo ::::: Create Dockerfile $ms
    echo 'FROM openjdk:8-jre-alpine' > Dockerfile
    echo 'VOLUME /tmp' >> Dockerfile
    echo 'ADD service/build/libs/service-0.1.0-BUILD-SNAPSHOT-boot.jar app.jar' >> Dockerfile
    echo "RUN /bin/sh -c 'touch /app.jar\'" >> Dockerfile
    echo 'ENV JAVA_OPTS=""' >> Dockerfile
    echo 'EXPOSE '${port} >> Dockerfile
    echo 'ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]' >> Dockerfile
    echo ::::: Building docker container $ms
    docker build -t $dockerTagPrefix/$ms . 
    cd ..

    port=$(($port + 1))
    echo $port
done