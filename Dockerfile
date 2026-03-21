FROM tomcat:9.0
COPY target/comp367-webapp-q2.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080