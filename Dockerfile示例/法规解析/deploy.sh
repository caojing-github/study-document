#!/usr/bin/env bash
mvn clean package -Dmaven.test.skip=true
docker build -t 172.16.71.2:5000/law_parser:178 --build-arg JAR_FILE=target/law-parse-1.0-SNAPSHOT.jar .
docker push 172.16.71.2:5000/law_parser:178
docker run -itd -v /data:/data --rm -v /etc/hosts:/etc/hosts -p 8081:8080 -e SPRING_PROFILES_ACTIVE=dev ds2:5000/law_parser:178
