*This project has been created as part of the 42 curriculum by julcleme.*

# Inception
## Description
This project aims to broaden knowledge of system administration by using Docker. We virtualize several Docker images, creating them in a new personal virtual machine (or local environment).

### Virtual Machines vs Docker
Virtual Machines virtualize the entire hardware layer and run a full guest OS, which makes them heavy and resource-intensive. Docker (containers) virtualizes the OS kernel, sharing it among isolated containers. Containers are lightweight and start almost instantly.

### Secrets vs Environment Variables
Environment variables are passed to containers at runtime and are visible to anyone with access to the system or using `docker inspect`. Docker Secrets provide a more secure mechanism for passing sensitive data, such as passwords, by mounting them directly in memory (tmpfs) rather than saving them on disk or in standard environment variables.

### Docker Network vs Host Network
Host network connects a container directly to the host machine's network stack, which can lead to port conflicts and reduced isolation. A custom Docker Network provides isolated DNS resolution and secure communication between containers without exposing them to the host network directly, improving security.

### Docker Volumes vs Bind Mounts
Bind mounts link a specific path on the host to a path inside the container, depending heavily on the host's exact directory structure and permissions. Docker Volumes are managed entirely by Docker, making them safer, more portable, and easier to back up.

## Instructions
1. Navigate to the project root.
2. Run `make` to build and launch the infrastructure.
3. Everything is automatically provisioned via the `Makefile` and `docker-compose.yml`.
4. Ensure your hosts file maps your domain (e.g. `julcleme.42.fr`) to `127.0.0.1`.

## Resources
- [Docker Documentation](https://docs.docker.com/)
- [NGINX Documentation](https://nginx.org/en/docs/)
- [MariaDB Knowledge Base](https://mariadb.com/kb/en/)
- [WordPress Core](https://wordpress.org/support/)
- AI tools were used to quickly bootstrap boilerplate documentation (README formatting) and basic Dockerfile syntax validations.
