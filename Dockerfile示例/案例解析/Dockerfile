FROM openjdk:8-jdk
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
VOLUME /tmp

ARG JAR_FILE
COPY ${JAR_FILE} /app.jar

COPY src/main/ruta /ruta
RUN sed -i 's:<string>.*src/main:<string>:g' /ruta/descriptor/com/icourt/articleRefForCaseEngine.xml

ENTRYPOINT ["java","-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]

