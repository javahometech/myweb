FROM tomcat:8.0.20-jre8

COPY myweb/target/myweb-0.11.0.war /usr/local/tomcat/webapps/myweb.war
