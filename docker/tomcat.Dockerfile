# OLD DOCKERFILE
# keeping it for reference
# this was meant to be used for development purposes
FROM tomcat:9-jdk21@sha256:2379f337c97e4604b996d65a072737d7cb55ddef4a264c24be5539a0f499ac8a

RUN adduser tomcat

RUN chown -R tomcat:tomcat  /usr/local/tomcat/webapps

COPY ../build/libs/*.war /usr/local/tomcat/webapps/

USER tomcat

EXPOSE ${PORT}

CMD ["catalina.sh", "run"]
