# Base image of the application this

FROM eclipse-temurin:21-jdk-jammy

# update the image

RUN apt-get update && apt-get upgrade -y

# Set Working directory

WORKDIR /app

# COPY the file

COPY . .

# Install the libraries with maven

RUN chmod +x mvnw &&  ./mvnw clean package -DskipTests -B && mv target/*.jar app.jar


# EXPOSE 

EXPOSE 8080

# RUN the application

CMD ["java", "-jar", "app.jar"]
