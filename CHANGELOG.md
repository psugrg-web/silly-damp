# Release Notes

## Unreleased

- PHP update to v8.4
- MySQL update to v9.5.0 - These changes are backwards incompatible. Please remove persistent volume.
- The Apache configuration update method has bee changed from using SED directly on the default configuration file from Dockerfile, to explicit `.docker/apache/default.conf` file thats copied to `/etc/apache2/sites-enabled/000-default.conf` file inside the docker container via the `docker-compose.yaml` file.

## v0.1.0

- First working version