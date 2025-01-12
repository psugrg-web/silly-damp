# Silly Docker-based LAMP (Linux Apache Mysql PHP)

Very basic approach that's primarily designed to act as a snippet for simple development and learning activities.

It contains a simple example application located in the `/app` directory, and a simple example of a *MySql* dump file `/dump/myDb.sql` that can be used to initialize the database.

## Usage

### Create & run the example application

- Create `.env` file with configuration in the top level directory. You can use `.env.example` file as a starting point. Just use `cp .env.example .env`.
- *Optionally*[^1] export `UID` to expose the user id as an environmental variable by calling `export UID=${UID}`[^2].
- Run the following command to compile and run the complete suite

    ```sh
    docker compose build && docker compose up -d
    ```

- Navigate to [localhost:8080](localhost:8080) in your browser to access the application, and [localhost:8081](localhost:8081) to access *phpMyAdmin*.

### Start new Laravel project

- Delete the `/app/public` folder **and** the `/dump/myDb.shq` file **before** creating the image.
- Create `.env` file with configuration in the top level directory. You can use `.env.example` file as a starting point. Just use `cp .env.example .env`.
- *Optionally*[^1] export `UID` to expose the user id as an environmental variable by calling `export UID=${UID}`[^2].
- Run the following command to compile and run the complete suite

    ```sh
    docker compose build && docker compose up -d
    ```

    > [!NOTE]
    >
    > The name of the image will be the same as the folder name of the project.

- Attach to runing container that has been created
- Stay on the top level directory
- Run `composer global require laravel/installer` to install the *Laravel* framework.

    > [!NOTE]
    >
    > This will install the *Laravel* framework binaries to `~/.composer/vendor/bin` directory.

- Run `~/.composer/vendor/bin/laravel new app -f` to create a new example application.

    > [!NOTE]
    >
    > The `/app` folder exists therefore we must force the app creation by using the `-f` flag.

- Select *MySql` as a database in the configuration wizard.
- Don't run default database migrations when asked by the configuration wizard.
- Restart docker container containing the app.

    > [!NOTE]
    >
    > After installation the `/app/public` volume mounting point may be broken. Docker container restart will fix the problem.

- Update database configuration in the `/app/.env` file.

    ```txt
    DB_CONNECTION=mysql
    DB_HOST=127.0.0.1
    DB_PORT=3306
    DB_DATABASE=app
    DB_USERNAME=root
    DB_PASSWORD=
    ```

    > [!TIP]
    > 
    > This is how it looks when used with the example configuration:
    > ```txt
    > DB_CONNECTION=mysql
    > DB_HOST=mysql
    > DB_PORT=3306
    > DB_DATABASE=myDb
    > DB_USERNAME=user
    > DB_PASSWORD=test
    > ```

- Run `php artisan migrate:fresh` to initialize the database.
- Navigate to [localhost:8080](localhost:8080) in your browser to access the application, and [localhost:8081](localhost:8081) to access *phpMyAdmin*.


[^1]: Default `UID`, set by the `.env` file will be used if this step is not performed.  
[^2]: This should be done even if there's an automatic Bash `UID` read only variable present since it is ignored by the docker.

## Notes

- PHP with Apache server requires root as a user therefore it's currently not possible to use it with normal user

## Inspiration

- [laravel-apache-docker](https://github.com/veevidify/laravel-apache-docker/tree/master)
