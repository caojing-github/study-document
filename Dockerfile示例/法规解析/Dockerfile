FROM openjdk:8
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
VOLUME /tmp
ARG JAR_FILE
COPY ${JAR_FILE} /app.jar
COPY src/main/ruta /ruta
RUN sed -i 's:<string>.*src/main:<string>:g' /ruta/descriptor/com/icourt/articleRefEngine.xml
RUN sed -i 's:<string>.*src/main:<string>:g' /ruta/descriptor/com/icourt/lawParserEngine.xml
RUN sed -i 's:<string>.*src/main:<string>:g' /ruta/descriptor/com/icourt/sharedTypesEngine.xml
RUN sed -i 's:<string>.*src/main:<string>:g' /ruta/descriptor/com/icourt/taxLawParserEngine.xml
RUN sed -i 's:<string>.*src/main:<string>:g' /ruta/descriptor/com/icourt/timeLimitedParserEngine.xml

ENTRYPOINT ["java","-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5006","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
