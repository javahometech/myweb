FROM tomcat

ADD target/myweb.war /usr/local/tomcat/webapps
