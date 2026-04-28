FROM tomcat:9.0-jdk8-temurin

# Deploy the prebuilt WAR as the ROOT app.
COPY SRC/dist/Enabling2.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
