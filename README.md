# Silly Docker-based LAMP (Linux Apache Mysql PHP)

Very basic approach that's primarily designed to act as a snippet for simple development.

## Usage

Run the following command to compile and run the complete suite

```sh
docker compose build \
    --build-arg USER_NAME=${USER} \
    --build-arg USER_ID=$(id -u ${USER}) \
    --build-arg GROUP_NAME=${USER} \
    --build-arg GROUP_ID=$(id -g ${USER}) \
&& docker compose up -d
```

> **Note**  
> Remember to create `.env` file with configuration. You can use `.env.example` file as a starting point. Just use `cp .env.example .env`

## Notes

- PHP with Apache server requires root as a user therefore it's currently not possible to use it with normal user

## Inspiration

- [laravel-apache-docker](https://github.com/veevidify/laravel-apache-docker/tree/master)
