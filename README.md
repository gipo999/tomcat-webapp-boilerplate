# Tomcat Webapp Boilerplate

Proof of concept for a tomcat webapp boilerplate with gradle, docker, compose, pre commit, post commit, pre push, on pr, on dev push, cron, security and Dynamic Application Security Testing (DAST).

It performs tests on the code and the container, and checks for vulnerabilities.
test

## Features

## Basics

### Development

- Live environment with a `tomcat` docker image
- Auto-restart on src change with `npm run dev` utilizing compose and nodemon
- Linting with `npm run lint`
- Fixing linting issues with `npm run fix`

### Git Hooks

- pre-commit
- post-commit
- pre-push

### Github Actions

Must be buildable and pass all checks with `gradlew buildWar`

Verifies the war is runnable with a health check http request on the container.

- on pr
- on dev push
- cron jobs

### Release

- Automatic release with `semantic-release` and `commitizen`

### Static code analyzers

- semgrep
- sonarqube
- codeql
- dependency review
- dependabot security alerts
- snyk open source
- snyk container
- snyk code

### Dynamic Application Security Testing (DAST)

- OWASP ZAP (Zed Attack Proxy)
- snyk
- Custom actions:
  👷 In progress: custom actions
  Using self built cli tool with cobra and go @ <https://github.com/gipo355/docker-vuln-scanners> to be run in container
  Used in actions like <https://github.com/gipo355/docker-vuln-scanners-nmap-action>

  - nmap
  - load tester with wrk
  - wapiti
  - others

### Sarif Reports

sarif reports can be uploaded to github with the `upload-sarif` action

they provide a standard format for static analysis tools, and can be used in github security tab
to have a better overview of the vulnerabilities and identify the tools that generated them

👷 In progress: sarif reports

Must convert manually zap, nmap, fix snyk

### Auto upload images

- dockerhub (gipo999/tomcat-webapp-boilerplate)
  <https://github.com/gipo999/tomcat-webapp-boilerplate/pkgs/container/tomcat-webapp-boilerplate>
- github packages (gipo999/tomcat-webapp-boilerplate)
  <https://hub.docker.com/r/gipo999/tomcat-webapp-boilerplate>

## env vars needed in github secrets

- SEMGREP_APP_TOKEN
- DOCKERHUB_TOKEN
- DOCKERHUB_USERNAME
- SNYK_TOKEN
- PAT
- CODECOV_TOKEN

## Notes (will move to /docs)

### security and Dynamic Application Security Testing (DAST)

<https://owasp.org/www-community/Free_for_Open_Source_Application_Security_Tools>

zap

OWASP ZAP (Zed Attack Proxy)

snyk

codeql

semgrep

dependency review

sonarqube

dependabot security alerts

## alternatives or additions

### strongest (paid)

nessus
<https://medium.com/@ben.swain_70016/attack-surface-monitoring-github-actions-nessus-3e3e83d44a34>

acunetix

burpsuite

purpleteam

### free

nuclei

nmap

flan <https://github.com/cloudflare/flan>

trivy

<https://github.com/topics/vulnerability-assessment>

### TODO: take a look at <https://github.com/greenbone/openvas-scanner/actions/runs/9346345737>

### other static analysis tools

<https://github.com/eclipse/steady>
