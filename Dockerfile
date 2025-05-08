# Usage
# docker build -t iliasbro/mariposas .
# docker run --name mariposas -p 8080:8080 -d iliasbro/mariposas

FROM openjdk:21-jdk-slim

# Copy Files
WORKDIR /usr/src/app
COPY models models
COPY src src
COPY .mvn .mvn
COPY pom.xml mvnw ./

# Install
RUN ./mvnw -Dmaven.test.skip=true package

# Docker Run Command
EXPOSE 8080
CMD ["java","-jar","/usr/src/app/target/playground-0.0.1-SNAPSHOT.jar"]