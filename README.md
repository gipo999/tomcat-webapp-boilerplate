both images at:

<https://github.com/gipo999/tomcat-webapp-boilerplate/pkgs/container/tomcat-webapp-boilerplate>

<https://hub.docker.com/r/gipo999/tomcat-webapp-boilerplate>

working with `./gradlew war`

compose up -d

# env vars

- SEMGREP_APP_TOKEN
- DOCKERHUB_TOKEN
- DOCKERHUB_USERNAME
- SNYK_TOKEN
- PAT
- CODECOV_TOKEN

# feats

- gradle

- docker

- compose
  auto restart on src change

- pre commit

- post commit

- pre push

- on pr
  test, check, war, tomcat /health
  vulnerability checks on container and image

- on dev push

- cron
