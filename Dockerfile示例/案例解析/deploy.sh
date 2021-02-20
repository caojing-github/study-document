#!/usr/bin/env bash
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
mvn clean package
docker build -t 172.16.71.2:5000/judgment-parse:200223-1 --build-arg JAR_FILE=target/judgment-parse-1.0-SNAPSHOT.jar .
# docker run -it --rm --network=host -p 8080:8080 -e SPRING_PROFILES_ACTIVE=custom -e HANLP_ROOT=/Users/zkc/Repository/data-for-1.7.5 ds2:5000/judgment-parse:1119a
docker push 172.16.71.2:5000/judgment-parse:200223-1
docker run -itd --rm -v /etc/hosts:/etc/hosts -v /data:/data -p 9090:8080 -p 5005:5005 -e SPRING_PROFILES_ACTIVE=pro -e HANLP_ROOT=/data/hanlp ds2:5000/judgment-parse:200223-1