# OLD DOCKERFILE
# keeping it for reference
# this was meant to be used for development purposes
FROM tomcat:10-jdk21@sha256:7da39e08ce940943ee3fdf59e580fcfeb7ede1d77a341b80189fccdedc512bd4

RUN adduser tomcat

RUN chown -R tomcat:tomcat  /usr/local/tomcat/webapps

COPY ../build/libs/*.war /usr/local/tomcat/webapps/

USER tomcat

EXPOSE ${PORT}

CMD ["catalina.sh", "run"]
