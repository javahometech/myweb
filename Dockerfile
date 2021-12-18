FROM openjdk:8-alpine

# Required for starting application up.
RUN apk update && apk add /bin/sh

RUN mkdir -p /opt/app
ENV PROJECT_HOME /opt/app

COPY target/myweb-8.2.0.jar $PROJECT_HOME/myweb-8.2.0.jar

WORKDIR $PROJECT_HOME

CMD ["java" ,"-jar","./myweb-8.2.0.jar"]
