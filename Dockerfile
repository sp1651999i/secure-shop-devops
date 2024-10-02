# Use a lightweight base image with OpenJDK 8
FROM openjdk:8u151-jdk-alpine3.7

# Set a non-root user for running the application
RUN adduser -D imagebuilder
USER imagebuilder

# Expose the port on which the application will run

# Set the working directory to /usr/app
WORKDIR /usr/app

# Run the application using a non-root user
CMD ["/bin/sh", "-c", "bash"]
