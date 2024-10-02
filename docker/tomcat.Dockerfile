# OLD DOCKERFILE
# keeping it for reference
# this was meant to be used for development purposes
FROM tomcat:10-jdk21@sha256:9a09e6b3a2f978be30bbfb98aee0d377e1d83c4ed7b666f970dd6d937e7dfd09

RUN adduser tomcat

RUN chown -R tomcat:tomcat  /usr/local/tomcat/webapps

COPY ../build/libs/*.war /usr/local/tomcat/webapps/

USER tomcat

EXPOSE ${PORT}

CMD ["catalina.sh", "run"]
