# Dockerfile
FROM eclipse-temurin:21-jdk-alpine
WORKDIR /app
COPY target/playground-0.0.1-SNAPSHOT.jar app.jar
COPY models/model.zip /app/model.zip
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
