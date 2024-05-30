# steps: 
# 1. build image on java image
# 2. move war to tomcat image
# 3. run tomcat image

FROM eclipse-temurin:21 as BUILD_IMAGE

# VULN: should probably not run as root

# VULN: should probably move to alpine, preferably embedding tomcat in the app

# initialize defaults for overriding through --env

# example
ENV INFISICAL_TOKEN='' 

ENV PORT=8080

RUN mkdir -p /home/app

WORKDIR /home/app

COPY . /home/app

WORKDIR /home/app

RUN ./gradlew war

## MULTI STAGE

FROM tomcat:9-jdk21-temurin-jammy

COPY --from=BUILD_IMAGE /home/app/build/libs/* /usr/local/tomcat/webapps

EXPOSE ${PORT}

CMD ["catalina.sh", "run"]
