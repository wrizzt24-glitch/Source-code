FROM tomcat:9.0-jdk8-temurin

# Install unzip
RUN apt-get update && apt-get install -y unzip && rm -rf /var/lib/apt/lists/*

# Remove default ROOT
RUN rm -rf /usr/local/tomcat/webapps/ROOT
RUN mkdir -p /usr/local/tomcat/webapps/ROOT

# Copy and extract the WAR file directly into ROOT
# unzip converts backslashes to forward slashes but returns exit code 1 (warning).
# We use || true to ignore the warning and let the build succeed.
COPY SRC/dist/Enabling2.war /tmp/app.war
RUN unzip /tmp/app.war -d /usr/local/tomcat/webapps/ROOT/ || true
RUN rm /tmp/app.war

EXPOSE 8080
