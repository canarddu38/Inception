# User Documentation

## Understand what services are provided by the stack
- **NGINX**: A web server acting as the  entrypoint to the infrastructure on port 443 (HTTPS).
- **WordPress**: The content management system for the website.
- **MariaDB**: The database storing the WordPress content and users.

## Start and stop the project
- To start: Execute `make` or `make all` from the root of the directory.
- To stop: Execute `make stop`.
- To completely clean up (remove containers, images, and volumes - **warning: deletes data**): Execute `make clean`.

## Access the website and the administration panel
- The main website is available at `https://julcleme.42.fr`
- The WordPress administration panel is available at `https://julcleme.42.fr/wp-admin`
- Ensure you accept the self-signed certificate warning the first time you connect.

## Locate and manage credentials
- Credentials (such as database passwords and user combinations) are defined in the `srcs/.env` file. You should never commit this file to public repositories. 

## Check that the services are running correctly
- You can check that all services are running correctly by executing: `docker ps`
- To view logs for a specific service: `docker logs <container_name>` (e.g., `docker logs nginx`).
