# Build the JAR
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

#Create lightweight image to run the app
FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app

# Copy the JAR built in the first stage
COPY --from=build /app/target/*.jar travel.jar

# Expose app port
EXPOSE 8080

# Start the Spring Boot application
ENTRYPOINT ["java", "-jar", "travel.jar"]
