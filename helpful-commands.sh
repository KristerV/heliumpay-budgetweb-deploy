
# Create machine on DigitalOcean
docker-machine create --driver=digitalocean \
--digitalocean-access-token=[omitted] \
--digitalocean-image=coreos-alpha \
--digitalocean-region=fra1 \
--digitalocean-size=1GB \
--digitalocean-ssh-user=core \
helium-coreos-1

# OR use an existing machine
docker-machine ls

# Make the command "docker" work on the server as if it was local.
eval $(docker-machine env helium-coreos-1)

# Deploy and build if any updates
docker-compose up -d --build

# Check what containers are running on machine
docker ps

# Check logs
docker-compose logs backend

# SSH into the container
docker ps # get containerId
docker exec -ti containerId /bin/bash # Or instad of /bin/bash run a command