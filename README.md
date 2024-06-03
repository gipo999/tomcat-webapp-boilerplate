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

# security and Dynamic Application Security Testing (DAST)

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
