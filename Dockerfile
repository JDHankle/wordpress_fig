#Grab the latest Ubuntu
FROM ubuntu:latest

#Create our workdir
RUN mkdir /app

#Install packages
RUN apt-get update -qq && apt-get install -y curl php5-cli php5-mysql mysql-client

#Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar

#Add wp user
RUN adduser --disabled-password --gecos '' wp && adduser wp sudo && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN mv wp-cli.phar /usr/local/bin/wp
RUN chown wp /app

#Move to app folder
WORKDIR /app
USER wp

#Add workdir
ADD . /app
