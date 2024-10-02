# Use a lightweight base image with OpenJDK 8
# Use an official Java 17 image as a base
FROM openjdk:17-jdk-alpine AS jdk-base

# Use an official Maven 3 image as a base
FROM maven:3.6.0-jdk-11-asjava17-alpine AS maven-base

# Use the base images to create a new image
COPY --from=jdk-base /

# Set the working directory to /app
WORKDIR /app

# Copy the Maven installation directory
COPY ./mvn /opt/maven

# Set MAVEN_HOME and PATH environment variables
ENV MAVEN_HOME=/opt/maven
ENV PATH=$MAVEN_HOME/bin:$PATH

# Install Maven
RUN mvn -version

# Set a non-root user for running the application


# Expose the port on which the application will run
EXPOSE 8070

WORKDIR /app

COPY ./ /app/


RUN ls

#RUN find / -iname 'apache-maven-3.0-bin.tar.gz'

#COPY ./apache-maven-3.0-bin.tar.gz /opt/apache-maven-3.0.tar.gz

#RUN tar -xvf /opt/apache-maven-3.0.tar.gz -C /opt/

#RUN rm -f /opt/apache-maven-3.0.tar.gz

#ENV M2_HOME='/opt/apache-maven-3.0'

#ENV PATH="$M2_HOME/bin:$PATH"

# Copy the JAR file to the /usr/app directory
#COPY target/shopping-cart*.jar /usr/app/

# Set the working directory to /usr/app
#WORKDIR /usr/app

# Run the application using a non-root user
CMD ["bash"]
