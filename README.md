# Helium Budget Proposals Deploy script

Deploy Helium Budget Proposals backend, frontend and everything else that goes along with it.

There are 3 Helium specific things this procedure will download:

1. Backend: https://github.com/KristerV/heliumpay-budgetweb-backend
1. Frontend: https://github.com/KristerV/heliumpay-budgetweb-frontend
1. Daemon: https://github.com/gjhiggins/dash/archive/helium.zip

These are hardcoded since the `docker build` process heavily depends on what it downloads.

## Commands to deploy

**Install prerequisites**

Arch Linux `yaourt -S docker docker-compose docker-machine && systemctl start docker`

**Tell DM where to find CoreOS in the first place**

_I have no idea.. Fill when you find out._

**Connect docker-machine to CoreOS server**

`eval $(docker-machine env helium-core-1)`

**Build and Deploy**

`docker-compose up -d`

**Apply certs**

Haven't figured this part out properly so you'll have to enable SSL manually.

1. SSH into the container with `docker-compose exec nginx /bin/bash`
1. Run certbot `certbot --nginx`
1. Answer all questions _wisely_.

## Commands to update the code

**Update container**

`docker build backend/ --no-cache`

**Connect to server**

`eval $(docker-machine env helium-core-1)`

**Deploy**

`docker-compose up -d`

## Other useful commands

List running containers: `docker ps`
List available containers: `docker container ls`
List available images: `docker image ls`

Stop all containers: `docker-compose down`
See logs for container: `docker-compose logs backend`
Rebuild only changed layers (and deploy): `docker-compose up -d --build`