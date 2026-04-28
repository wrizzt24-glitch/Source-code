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

# Fix Java Version Error (UnsupportedClassVersionError)
# Recompile the Java sources inside the container using Java 8 to ensure compatibility
COPY SRC/src/java/pack/*.java /tmp/src/pack/
RUN javac -cp "/usr/local/tomcat/lib/servlet-api.jar:/usr/local/tomcat/webapps/ROOT/WEB-INF/lib/*:/usr/local/tomcat/webapps/ROOT/WEB-INF/classes" -d /usr/local/tomcat/webapps/ROOT/WEB-INF/classes /tmp/src/pack/*.java

EXPOSE 8080
