FROM ubuntu:latest

# Install Certbot
RUN apt update
RUN apt install -y software-properties-common
RUN add-apt-repository ppa:certbot/certbot
RUN apt update
RUN apt install -y python-certbot-nginx

# Install Nginx
RUN apt install -y nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Run nginx
CMD nginx -g 'daemon off;'

# Certbot will have to be run manually after deployment: `certbot --nginx`