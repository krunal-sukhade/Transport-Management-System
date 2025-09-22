# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the built jar file into the container
COPY target/*.jar app.jar

# Expose is just informational; the app will actually bind to whatever $PORT is set to
EXPOSE 8080

# Allow JAVA_OPTS to be passed at runtime
ENV JAVA_OPTS=""

# Run the jar file; Render will set PORT, your app should use server.port=${PORT:8080}
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
