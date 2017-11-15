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

**Get environment secrets**

Make a file called `.env.production.secrets` (or whatever) and insert env variables like so:

```
export DB_HOST=xxx
export DB_PORT=xxx
export MAILGUN_API_KEY=xxx
export MAILGUN_DOMAIN=xxx
```

This is not the full list of variables needed. Later when we're using Docker Swarm, we can use `docker secret` for this.

**Build and Deploy**

`(source .env.production.secrets && docker-compose up -d)`

**Enable SSL**

Haven't figured this part out properly so you'll have to enable SSL manually.

1. SSH into the container with `docker-compose exec nginx /bin/bash`
1. Run certbot `certbot --nginx`
1. Answer all questions _wisely_.

## Commands to update the code

**Update container**

`docker-compose build --no-cache backend`

**Connect to server**

`eval $(docker-machine env helium-core-1)`

**Deploy**

`docker-compose up -d`

## Update SSL cert

Sorry, this is still manual.

1. SSH into the container with `docker-compose exec nginx /bin/bash`
1. Run certbot `certbot renew`

## Other useful commands

List running containers: `docker ps`  
List available containers: `docker container ls`  
List available images: `docker image ls`  

Stop all containers: `docker-compose down`  
See logs for container: `docker-compose logs backend`  
Rebuild only changed layers (and deploy): `docker-compose up -d --build`  