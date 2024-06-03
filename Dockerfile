# # steps: 
# # 1. build image on java image
# # 2. move war to tomcat image
# # 3. run tomcat image
#
# # FROM eclipse-temurin:21@sha256:2e387a63a9086232a53fb668f78bcda1f233118f234326fcb88b0bb2a968ec39 as BUILD_IMAGE
# FROM gradle:8-jdk21 as BUILD_IMAGE
#
# # VULN: should probably not run as root
#
# # VULN: should probably move to alpine, preferably embedding tomcat in the app
#
# # initialize defaults for overriding through --env
#
# # example
# ENV INFISICAL_TOKEN='' 
#
# ENV PORT=8080
#
# RUN mkdir -p /home/app
#
# WORKDIR /home/app
#
# COPY . /home/app
#
# WORKDIR /home/app
#
# # RUN ./gradlew war
# # if we don't use the wrapper, we can use the gradle image and prevent 
# # downloading gradle every time which takes ALOT and allows for caching
# RUN gradle war

FROM tomcat:9-jdk21@sha256:f7c4623aa616f46473003b325246befcc5fe7120b39b07c977dd44057bbdc306

# If not using multistage: docker file expects the war file to be in the build/libs folder.
# if we build it outside we can use github action gradle caching 
# to make the build faster

## IF MULTI STAGE
# COPY --from=BUILD_IMAGE /home/app/build/libs/* /usr/local/tomcat/webapps
## else
COPY build/libs/* /usr/local/tomcat/webapps

RUN adduser tomcat

RUN chown -R tomcat:tomcat  /usr/local/tomcat/webapps

# FIXME: this should be run in the compose or cli command to run
# HEALTHCHECK --interval=30s --timeout=10s --retries=5 --start-period=30s \
#     CMD curl --fail http://localhost:8080/tomcat-webapp-boilerplate/api/base/health || exit 1
# HEALTHCHECK --interval=30s --timeout=10s --retries=5 --start-period=30s \
#     CMD curl --fail http://localhost:8080/wrong || exit 1

USER tomcat

EXPOSE ${PORT}

CMD ["catalina.sh", "run"]
