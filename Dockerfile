FROM eclipse-temurin:21-jdk-alpine

WORKDIR /app

COPY . .

RUN ./mvnw -Dmaven.test.skip=true package

COPY models/model.zip /app/model.zip

EXPOSE 8080
CMD ["java", "-jar", "target/playground-0.0.1-SNAPSHOT.jar"]
