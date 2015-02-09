Use Fig to create a Docker container for running wp-cli and
WordPress.

NOTE: This will not automatically install or configure WordPress at
build time. You will have to do this after the build completes.

# Getting Started
You are going to need two things:

* Fig
* Docker

For more information on installing Fig and Docker on your system,
please view the [Fig Installation Guide](http://www.fig.sh/install.html)
Guide
[Docker Installation Guide](https://docs.docker.com/installation/).

# Building The Container

To get started download this repo and run a build:

```shell
fig build
```

Note: Depending on your docker configuration you may need to run these
commands as root:

```shell
sudo fig build
```

This will build two containers. One for WordPress and another for
MYSQL aliased to `db`.

# Installing WordPress

After building the container you may run wp-cli to create a new
WordPress site:

```shell
fig run web wp core download
```
And then you may generate a wp-config file:

```shell
fig run web wp core config --dbname='wordpress' --dbuser='root' --dbhost='db:3306'
```

From here you can run the WordPress installer from either wp-cli or
the web.

For more information on wp-cli please read the [WP-CLI Command Line
Reference](http://wp-cli.org/commands/).

## WP-CLI Method

If you decide to go with the cli installer:

```shell
fig run web wp core install --url="localhost" --title=mysite --admin_user=admin --admin_password=my_secret --admin_email='user@example.com'
```

## Web Method

If you decide to go with the web installer:

```shell
fig up
```

Open `http://localhost/` in the url field of your favorite
browser.

Then complete the steps just like a normal WordPress web install.

## Get Container IP

You can find a list of containers by running `fig ps`.

To find the IP of a container:

```shell
docker inspect --format='{{ .NetworkSettings.IPAddress }}' container_name
```

# Issues

If you have an issue, I would love to help you. Please create an issue
and I will look into it as soon as I can :).
