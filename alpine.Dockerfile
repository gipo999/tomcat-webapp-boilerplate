FROM eclipse-temurin:21-alpine

# example run envs
ENV PORT=8080
ENV HOST="localhost"


RUN addgroup --system tomcat-webapp-boilerplate && \
    adduser --system -G tomcat-webapp-boilerplate tomcat-webapp-boilerplate

RUN mkdir -p /home/tomcat-webapp-boilerplate/app/build/libs
RUN mkdir -p /home/tomcat-webapp-boilerplate/app/src/main

# COPY . /home/tomcat-webapp-boilerplate

COPY build/libs/tomcat-webapp-boilerplate-all.jar /home/tomcat-webapp-boilerplate/app/build/libs
COPY src/main/resources /home/tomcat-webapp-boilerplate/app/src/main/resources
COPY src/main/webapp /home/tomcat-webapp-boilerplate/app/src/main/webapp
# COPY . /home/tomcat-webapp-boilerplate/app

WORKDIR /home/tomcat-webapp-boilerplate/app

RUN chown -R tomcat-webapp-boilerplate:tomcat-webapp-boilerplate /home/tomcat-webapp-boilerplate/app

# FIXME: must run as non-root user
USER tomcat-webapp-boilerplate


# WORKDIR /app
#
# RUN addgroup --system its-battistar-angular && \
#     adduser --system -G its-battistar-angular its-battistar-angular
#
# COPY dist/apps/its-battistar-angular its-battistar-angular
# RUN chown -R its-battistar-angular:its-battistar-angular .

# You can remove this install step if you build with `--bundle` option.
# The bundled output will include external dependencies.
# RUN npm --prefix its-battistar-angular --omit=dev -f install


EXPOSE ${PORT}

CMD ["java", "-jar", "build/libs/tomcat-webapp-boilerplate-all.jar"]
# CMD ["java", "-jar", "/home/tomcat-webapp-boilerplate/app/build/libs/tomcat-webapp-boilerplate-all.jar"]

