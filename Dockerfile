# NOTE: initially a multi stage build was used, but it was removed to allow for caching of gradle dependencies
# Building a war inside the container downloads and reinstalls gradle and all dependencies every single time and it takes an absurd amount of time (4+ minutes added to every run).
# I will leave it here for reference but the CI actions build in baremetal and copy the outputs inside.
#
# # FROM eclipse-temurin:21@sha256:2e387a63a9086232a53fb668f78bcda1f233118f234326fcb88b0bb2a968ec39 as BUILD_IMAGE
# FROM gradle:8-jdk21 as BUILD_IMAGE <-- tried using gradle image but it was reinstalling gradle every time too (because of the gradle wrapper and foojay-resolver)
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

FROM tomcat:9-jdk21@sha256:701bdd15e1cf25451056932397b582681e5c2afbd5a4bd540835b47e0a31a4c3

# If not using multistage: docker file expects the war file to be in the build/libs folder.
# if we build it outside we can use github action gradle caching 
# to make the build faster

# TODO: inizialize ENVs to be overridden by --env

## IF MULTI STAGE
# COPY --from=BUILD_IMAGE /home/app/build/libs/* /usr/local/tomcat/webapps
## else
COPY build/libs/* /usr/local/tomcat/webapps

RUN adduser tomcat

# Permissions
# tomcat image allows tomcat user:group to run
RUN chown -R tomcat:tomcat  /usr/local/tomcat/webapps

USER tomcat

EXPOSE ${PORT}

CMD ["catalina.sh", "run"]
