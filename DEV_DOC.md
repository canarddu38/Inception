# Developer Documentation

## Set up the environment from scratch (prerequisites, configuration files, secrets)
1. Ensure Docker and Docker Compose are installed on your machine.
2. Ensure you have mapped `julcleme.42.fr` to `127.0.0.1` in your `/etc/hosts` file:
   `127.0.0.1    julcleme.42.fr`
3. A `.env` file must be present in `srcs/.env` containing the necessary environment variables:
   - DOMAIN_NAME
   - MYSQL_DATABASE, MYSQL_USER, MYSQL_PASSWORD, MYSQL_ROOT_PASSWORD
   - WP_TITLE, WP_ADMIN_USER, WP_ADMIN_PASSWORD, WP_ADMIN_EMAIL
   - WP_USER, WP_USER_PASSWORD, WP_USER_EMAIL

## Build and launch the project using the Makefile and Docker Compose
- The project leverages a custom `Makefile`.
- `make` or `make all`: Creates the required persistent local directories and runs `docker compose -f srcs/compose.yaml up --build -d`.
- `make stop`, `make clean` handle shutdown and cleanup.

## Use relevant commands to manage the containers and volumes
- Rebuild a single container: `docker compose -f srcs/compose.yaml build <service>`
- Restart a container: `docker restart <container>`
- Inspect volume details: `docker volume inspect <volume_name>`
- Accessing a running container's shell: `docker exec -it <container_name> /bin/bash`

## Identify where the project data is stored and how it persists
Data is persistently stored via Docker Volumes mapped to local directories:
- **MariaDB Database Files**: Stored locally in `/home/julcleme/data/mariadb/`.
- **WordPress Site Files**: Stored locally in `/home/julcleme/data/wordpress/`.
These directories are mounted specifically as Docker named volumes.
