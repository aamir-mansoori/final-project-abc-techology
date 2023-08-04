FROM tomcat:9-jdk11-temurin-focal
RUN rm -rf /usr/local/tomcat/webapps/ROOT
ADD ./target/*.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]
