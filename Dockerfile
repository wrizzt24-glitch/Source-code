FROM tomcat:9.0-jdk8-temurin

# Extract the WAR to fix Windows path separators
WORKDIR /tmp/war-fix
COPY SRC/dist/Enabling2.war /tmp/war-fix/app.war
RUN jar xf app.war && \
    rm app.war && \
    # Recreate the WAR with correct path separators
    jar cf /usr/local/tomcat/webapps/ROOT.war .

# Clean up
RUN rm -rf /tmp/war-fix
WORKDIR /usr/local/tomcat

EXPOSE 8080
