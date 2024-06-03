FROM tomcat:9-jdk21-temurin-jammy@sha256:f7c4623aa616f46473003b325246befcc5fe7120b39b07c977dd44057bbdc306

RUN adduser tomcat

RUN chown -R tomcat:tomcat  /usr/local/tomcat/webapps

COPY ../build/libs/*.war /usr/local/tomcat/webapps/

USER tomcat

EXPOSE ${PORT}

CMD ["catalina.sh", "run"]
