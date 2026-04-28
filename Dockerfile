FROM tomcat:9.0-jdk8-temurin

# Remove default ROOT
RUN rm -rf /usr/local/tomcat/webapps/ROOT
RUN mkdir -p /usr/local/tomcat/webapps/ROOT

# Copy and extract the WAR file directly into ROOT using jar
COPY SRC/dist/Enabling2.war /tmp/app.war
RUN cd /usr/local/tomcat/webapps/ROOT && jar xf /tmp/app.war && rm /tmp/app.war

EXPOSE 8080
