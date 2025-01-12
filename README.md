# Silly Docker-based LAMP (Linux Apache Mysql PHP)

Very basic approach that's primarily designed to act as a snippet for simple development and learning activities.

It contains a simple example application located in the `/app` directory, and a simple example of a *MySql* dump file `/dump/myDb.sql` that can be used to initialize the database.

> [!IMPORTANT]
>
> If you want to start from scratch, i.e. to start a new [Laravel](https://laravel.com/) project, it's recommended to delete the `/app/public` folder **and** the `/dump/myDb.shq` file **before** creating the image.

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

> WIP

> [!NOTE]
>
> The anem of the image will be the same as the folder name of the project.

[^1]: Default `UID`, set by the `.env` file will be used if this step is not performed.  
[^2]: This should be done even if there's an automatic Bash `UID` read only variable present since it is ignored by the docker.

## Notes

- PHP with Apache server requires root as a user therefore it's currently not possible to use it with normal user

## Inspiration

- [laravel-apache-docker](https://github.com/veevidify/laravel-apache-docker/tree/master)
