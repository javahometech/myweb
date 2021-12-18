FROM openjdk:8-alpine

# Required for starting application up.
RUN apk update && apk add /bin/sh

RUN mkdir -p /opt/app
ENV PROJECT_HOME /opt/app

COPY target/myweb-8.2.0.war $PROJECT_HOME/myweb-8.2.0.war

WORKDIR $PROJECT_HOME

CMD ["java" ,"-war","./myweb-8.2.0.war"]
