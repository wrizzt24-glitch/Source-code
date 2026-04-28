FROM tomcat:9.0-jdk8-temurin

# Install unzip and wget
RUN apt-get update && apt-get install -y unzip wget && rm -rf /var/lib/apt/lists/*

# Remove default ROOT
RUN rm -rf /usr/local/tomcat/webapps/ROOT
RUN mkdir -p /usr/local/tomcat/webapps/ROOT

# Copy and extract the WAR file directly into ROOT
COPY SRC/dist/Enabling2.war /tmp/app.war
RUN unzip /tmp/app.war -d /usr/local/tomcat/webapps/ROOT/ || true
RUN rm /tmp/app.war

# === NUCLEAR: Remove ALL old MySQL drivers ===
# List everything to debug in build logs
RUN echo "=== ALL FILES WITH mysql IN NAME ===" && \
    find /usr/local/tomcat/webapps/ROOT -iname "*mysql*" -type f 2>/dev/null || echo "none found by find"
RUN echo "=== Listing WEB-INF/lib ===" && \
    ls -la /usr/local/tomcat/webapps/ROOT/WEB-INF/lib/ 2>/dev/null | head -50 || echo "lib dir not found"
# Delete by every method possible
RUN find /usr/local/tomcat/webapps/ROOT -iname "*mysql*" -type f -delete 2>/dev/null || true
RUN rm -fv /usr/local/tomcat/webapps/ROOT/WEB-INF/lib/mysql* 2>/dev/null || true
# Also check for backslash-named files at the ROOT level
RUN find /usr/local/tomcat/webapps/ROOT -maxdepth 1 -type f -delete 2>/dev/null || true
RUN echo "=== AFTER DELETION ===" && \
    find /usr/local/tomcat/webapps/ROOT -iname "*mysql*" 2>/dev/null && echo "PROBLEM: mysql files still exist!" || echo "OK: All mysql files deleted"

# Download new MySQL 8 driver into BOTH locations to guarantee it's found
RUN wget -q https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/8.0.33/mysql-connector-j-8.0.33.jar -O /usr/local/tomcat/webapps/ROOT/WEB-INF/lib/mysql-connector-j-8.0.33.jar
RUN cp /usr/local/tomcat/webapps/ROOT/WEB-INF/lib/mysql-connector-j-8.0.33.jar /usr/local/tomcat/lib/mysql-connector-j-8.0.33.jar
RUN echo "=== FINAL STATE ===" && ls -la /usr/local/tomcat/webapps/ROOT/WEB-INF/lib/*mysql* && ls -la /usr/local/tomcat/lib/*mysql*

# Fix Java Version Error (UnsupportedClassVersionError)
# Recompile the Java sources inside the container using Java 8
COPY SRC/src/java/pack/*.java /tmp/src/pack/
RUN javac -cp "/usr/local/tomcat/lib/servlet-api.jar:/usr/local/tomcat/webapps/ROOT/WEB-INF/lib/*:/usr/local/tomcat/lib/*:/usr/local/tomcat/webapps/ROOT/WEB-INF/classes" -d /usr/local/tomcat/webapps/ROOT/WEB-INF/classes /tmp/src/pack/*.java

# Limit Java memory to prevent Railway Out-Of-Memory crashes
ENV CATALINA_OPTS="-Xms128m -Xmx256m -XX:MaxMetaspaceSize=128m"

EXPOSE 8080
