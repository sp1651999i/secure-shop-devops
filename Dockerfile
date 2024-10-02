# Use a lightweight base image with OpenJDK 8
FROM openjdk:8u151-jdk-alpine3.7

# Set a non-root user for running the application
RUN adduser -D imagebuilder
USER imagebuilder

# Expose the port on which the application will run
EXPOSE 8070

#WORKDIR /usr/app

RUN wget -P /opt/ https://archive.apache.org/dist/maven/binaries/apache-maven-3.0-bin.tar.gz

RUN tar -xvf /opt/apache-maven-3.0.tar.gz -C /opt/

RUN rm -f /opt/apache-maven-3.0.tar.gz

ENV M2_HOME='/opt/apache-maven-3.0'

ENV PATH="$M2_HOME/bin:$PATH"

# Copy the JAR file to the /usr/app directory
#COPY target/shopping-cart*.jar /usr/app/

# Set the working directory to /usr/app
#WORKDIR /usr/app

# Run the application using a non-root user
CMD ["bash"]
