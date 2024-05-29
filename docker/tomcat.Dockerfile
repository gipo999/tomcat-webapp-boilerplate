FROM tomcat:9-jdk21-temurin-jammy

RUN adduser tomcat

RUN chown -R tomcat:tomcat  /usr/local/tomcat/webapps

USER tomcat

EXPOSE ${PORT}

CMD ["catalina.sh", "run"]
