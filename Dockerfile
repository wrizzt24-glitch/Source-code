FROM tomcat:9.0-jdk8-temurin

# Remove default ROOT to avoid conflicts
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy the original WAR file directly as ROOT.war
COPY SRC/dist/Enabling2.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
