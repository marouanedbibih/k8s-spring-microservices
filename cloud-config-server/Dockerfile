FROM openjdk:11-jdk-slim
VOLUME /tmp
ARG JAR_FILE=target/your-app.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]
EXPOSE 9296