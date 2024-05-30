# FROM eclipse-temurin:21 as BUILD_IMAGE
FROM eclipse-temurin:21
# FROM tomcat:9-jdk21-temurin-jammy

# TODO: must provide gradle otherwise it downloads every restart??

# VULN: should probably not run as root

# initialize defaults for overriding through --env

# example
# ENV INFISICAL_TOKEN='' 

# ENV PORT=8080

# create a user to run the app to prevent filesystem access conflicts

RUN addgroup --system tomcat-webapp-boilerplate && \
    adduser --system -G tomcat-webapp-boilerplate tomcat-webapp-boilerplate

RUN mkdir -p /home/tomcat-webapp-boilerplate

COPY . /home/tomcat-webapp-boilerplate
RUN chown -R its-battistar-be-go:its-battistar-be-go .


WORKDIR /home/tomcat-webapp-boilerplate

USER tomcat-webapp-boilerplate

# RUN ./gradlew war

# $CATALINA_HOME is at /usr/local/tomcat

# EXPOSE ${PORT}

# no cmd, we provide this in the compose.yml file
CMD ["./gradlew", "war"]
