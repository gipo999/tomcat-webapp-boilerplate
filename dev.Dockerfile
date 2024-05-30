## MULTI STAGE

FROM tomcat:9-jdk21-temurin-jammy

COPY build/libs/* /usr/local/tomcat/webapps

EXPOSE ${PORT}

CMD ["catalina.sh", "run"]
