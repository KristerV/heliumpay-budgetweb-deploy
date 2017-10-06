# could use node:8, but it has an old libboost and the cli doesn't support it
FROM ubuntu:latest

# Prepare system
RUN apt update
RUN apt install -y curl git
RUN apt install -y libevent-dev libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt install -y nodejs

# Helium-cli conf
COPY helium-client.conf /root/.heliumcore/helium.conf

# Node app
WORKDIR /var/www/backend
RUN git clone https://github.com/KristerV/heliumpay-budgetweb-backend.git .
RUN npm install

# Run migrations
RUN npm run db:migrations:run

# Run
CMD npm run production