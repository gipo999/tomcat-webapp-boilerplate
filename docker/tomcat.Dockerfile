# OLD DOCKERFILE
# keeping it for reference
# this was meant to be used for development purposes
FROM tomcat:9-jdk21@sha256:8c247ee5bf39eaefcd6c457d468b04f11773e10a2bb0eb47281da9d91f0e4b44

RUN adduser tomcat

RUN chown -R tomcat:tomcat  /usr/local/tomcat/webapps

COPY ../build/libs/*.war /usr/local/tomcat/webapps/

USER tomcat

EXPOSE ${PORT}

CMD ["catalina.sh", "run"]
