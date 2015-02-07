FROM ubuntu:latest
ADD . /app
RUN apt-get update -qq && apt-get install -y curl php5-cli php5-mysql
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN adduser --disabled-password --gecos '' wp && adduser wp sudo && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN mv wp-cli.phar /usr/local/bin/wp
RUN chown wp /app
WORKDIR /app
USER wp
RUN wp core download
