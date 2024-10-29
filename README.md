# Silly Docker-based LAMP (Linux Apache Mysql PHP)

Very basic approach that's primarily designed to act as a snippet for simple development.

## Usage

> [!IMPORTANT]
>
> - Create `.env` file with configuration. You can use `.env.example` file as a starting point. Just use `cp .env.example .env`.
> - *Optionally*[^1] export `UID` to expose the user id as an environmental variable by calling `export UID=${UID}`[^2].

Run the following command to compile and run the complete suite

```sh
export UID=${UID}
docker compose build && docker compose up -d
```

[^1]: Default `UID`, set by the `.env` file will be used if this step is not performed.  
[^2]: This should be done even if there's an automatic Bash `UID` read only variable present since it is ignored by the docker.

## Notes

- PHP with Apache server requires root as a user therefore it's currently not possible to use it with normal user

## Inspiration

- [laravel-apache-docker](https://github.com/veevidify/laravel-apache-docker/tree/master)
