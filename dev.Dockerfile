## MULTI STAGE

FROM tomcat:9-jdk21-temurin-jammy@sha256:f7c4623aa616f46473003b325246befcc5fe7120b39b07c977dd44057bbdc306

COPY build/libs/* /usr/local/tomcat/webapps

EXPOSE ${PORT}

CMD ["catalina.sh", "run"]
