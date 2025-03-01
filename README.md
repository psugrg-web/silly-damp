# Silly Docker-based LAMP (Linux Apache Mysql PHP)

Very basic approach that's primarily designed to act as a snippet for simple
development and learning activities.

It contains a simple example application, and a simple example of a _MySql_
dump file `/dump/myDb.sql` that is used to initialize the database for that
application.

The project contains also the instruction of how to create a _Laravel_ application.

## Folder & files structure

The folder structure is inspired by the _Laravel_ project, and is probably
similar to any web project.

The top level directory of the project is linked to `/var/www/html` folder
and the `/public` folder is exposed by the _Apache_ server.

## Usage

> [!IMPORTANT]
> Export `UID` to expose the user id as an environment variable by calling
> `export UID=${UID}`[^1].  
> Export `USER` to expose the user id as an environment variable by calling
> `export USERNAME=${USER}`.

### Create & run the example application

Create `.env` file with configuration in the top level directory. You can use
`.env.example` file as a starting point. Just use `cp .env.example .env`.

Run the following command to compile and run the complete suite with the example
application.

```sh
docker compose build && docker compose up -d
```

> [!NOTE]
> Navigate to [localhost:8080](localhost:8080) in your browser to access the
> application, and [localhost:8081](localhost:8081) to access _phpMyAdmin_.

### Start new Laravel project

The development environment can be used to start a new Laravel project. Start
from compiling an running the development environment.

```sh
docker compose build && docker compose up -d
```

> [!NOTE]
> The name of the image will be the same as the folder name of the project.

Attach to runing container that has been created.

```sh
docker exec -it silly-damp-app-1 bash
```

Run `composer global require laravel/installer` to install the _Laravel_ framework.

> [!NOTE]
> This will install the _Laravel_ framework binaries to `~/.composer/vendor/bin`
> directory.

Initialize the _Laravel_ application.

```sh
rm -r ./public && rm -r ./dump \
&& ~/.composer/vendor/bin/laravel new my_app \
&& rm ./my_app/README.md && shopt -s dotglob && mv ./my_app/* . && rmdir my_app
```

> [!NOTE]
> The `/dump` folder is not needed in this step since we're creating the app
> from scratch, and the `/public` folder will be replaced by the _Laravel_
> application, therefore both are removed by the script.  
> The _Laravel_ environment will be created using composer. It will create the
> application in the temporary directory named `my_app`. The content of that
> folder will then be moved to the root directory of the project (except the
> `README.md` file). The temporary folder will be removed.  
> This way the whole project is nicely located in the top level directory.

Select `MySql` as a database in the configuration wizard, but **Don't run default
database migrations** when asked by the configuration wizard, since the
configuration of the database is not yet created.

Update database configuration in the `/.env` file.

```txt
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=app
DB_USERNAME=root
DB_PASSWORD=
```

> [!TIP]
> This is how it looks when used with the example configuration:
>
> ```txt
> DB_CONNECTION=mysql
> DB_HOST=mysql
> DB_PORT=3306
> DB_DATABASE=myDb
> DB_USERNAME=user
> DB_PASSWORD=test
> ```

Run `php artisan migrate:fresh` to initialize the database.

> [!NOTE]
> Navigate to [localhost:8080](localhost:8080) in your browser to access the
> application, and [localhost:8081](localhost:8081) to access _phpMyAdmin_.

[^1]:
    Default `UID`, set by the `.env` file will be used if this step is not performed.
    This should be done even if there's an automatic Bash `UID` read only variable present since it is ignored by the docker.

## Notes

- PHP with Apache server requires root as a user therefore it's currently not
  possible to use it with normal user

## Inspiration

- [laravel-apache-docker](https://github.com/veevidify/laravel-apache-docker/tree/master)
