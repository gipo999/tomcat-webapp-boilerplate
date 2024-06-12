# OLD DOCKERFILE
# keeping it for reference
# this was meant to be used for development purposes
FROM tomcat:9-jdk21@sha256:701bdd15e1cf25451056932397b582681e5c2afbd5a4bd540835b47e0a31a4c3

RUN adduser tomcat

RUN chown -R tomcat:tomcat  /usr/local/tomcat/webapps

COPY ../build/libs/*.war /usr/local/tomcat/webapps/

USER tomcat

EXPOSE ${PORT}

CMD ["catalina.sh", "run"]
