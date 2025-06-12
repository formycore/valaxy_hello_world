# Stage 1: Maven Build
FROM maven:3.8.8-openjdk-17 AS build
COPY . /app
WORKDIR /app
RUN mvn clean package

# Stage 2: Run Jar
FROM openjdk:17
COPY --from=build /app/target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]
