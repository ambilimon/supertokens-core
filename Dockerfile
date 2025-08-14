# Use an official OpenJDK runtime as a parent image
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Build the SuperTokens core
RUN ./gradlew assemble

# Expose the port SuperTokens Core runs on
EXPOSE 3567

# Run the SuperTokens Core
CMD ["java", "-Djava.security.egd=file:/dev/urandom", "-classpath", "./core/*:./plugin-interface/*", "io.supertokens.Main", "./"]
