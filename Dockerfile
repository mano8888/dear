FROM tomcat:7.0
COPY target/cont.war /usr/local/tomcat/webapps
ENTRYPOINT /usr/local/tomcat/bin/startup.sh && bash
EXPOSE 8080

FROM ubuntu 
RUN apt-get update
RUN apt-get install -y nginx
COPY dock1 usr/local/nginx/html
ENTRYPOINT service nginx start && bash

FROM jenkins
USER root
ENV JAVA_OPTS="-Xmx4096m"
ENV JENKINS_OPTS=" --handlerCountMax=200"
RUN mkdir /var/log/jenkins-log
EXPOSE 8080




