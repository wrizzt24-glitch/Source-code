FROM tomcat:9.0-jdk8-temurin

# Install Ant
RUN apt-get update && apt-get install -y ant && rm -rf /var/lib/apt/lists/*

# Copy project source
WORKDIR /build
COPY SRC/ .

# Build WAR using Ant
RUN ant dist

# Deploy the built WAR as the ROOT app
RUN cp dist/Enabling2.war /usr/local/tomcat/webapps/ROOT.war

# Clean up build files
WORKDIR /usr/local/tomcat
RUN rm -rf /build

EXPOSE 8080
