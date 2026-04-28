FROM tomcat:9.0-jdk8-temurin

# Install unzip and wget
RUN apt-get update && apt-get install -y unzip wget && rm -rf /var/lib/apt/lists/*

# Remove default ROOT
RUN rm -rf /usr/local/tomcat/webapps/ROOT
RUN mkdir -p /usr/local/tomcat/webapps/ROOT

# Copy and extract the WAR file directly into ROOT
# unzip converts backslashes to forward slashes but returns exit code 1 (warning).
# We use || true to ignore the warning and let the build succeed.
COPY SRC/dist/Enabling2.war /tmp/app.war
RUN unzip /tmp/app.war -d /usr/local/tomcat/webapps/ROOT/ || true
RUN rm /tmp/app.war

# Upgrade MySQL Driver to support caching_sha2_password
RUN find /usr/local/tomcat/webapps/ROOT -name "mysql-connector-java*.jar" -type f -delete
RUN wget https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/8.4.0/mysql-connector-j-8.4.0.jar -P /usr/local/tomcat/webapps/ROOT/WEB-INF/lib/

# Fix Java Version Error (UnsupportedClassVersionError)
# Recompile the Java sources inside the container using Java 8 to ensure compatibility
COPY SRC/src/java/pack/*.java /tmp/src/pack/
RUN javac -cp "/usr/local/tomcat/lib/servlet-api.jar:/usr/local/tomcat/webapps/ROOT/WEB-INF/lib/*:/usr/local/tomcat/webapps/ROOT/WEB-INF/classes" -d /usr/local/tomcat/webapps/ROOT/WEB-INF/classes /tmp/src/pack/*.java

EXPOSE 8080
