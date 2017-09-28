FROM tomcat
MAINTAINER hari@javahome.in
RUN apt-get update

ADD target/myweb.war /usr/local/tomcat/webapps
