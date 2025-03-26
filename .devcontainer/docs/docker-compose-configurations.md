# Docker Compose Configurations

This document explains the usage of `docker-compose.yml` and extendable configurations in the development container setup.

## 1. Default Configuration: `docker-compose.yml`

The default `docker-compose.yml` file defines the main services and volumes for the development container. It is always included in the setup and provides the base configuration for the container.

### Key Features:
- Defines the primary service (`arch-kde`) for the development environment.
- Mounts volumes for persistent storage:
  - `arch-kde-home`: Stores user-specific configuration.
  - `arch-kde-workspace`: Maps the dotfiles repository to the container.
- Sets environment variables such as `PUID`, `PGID`, and `TZ`.

### Example:
```yaml
services:
  arch-kde:
    container_name: arch-kde
    build: .
    environment:
      PUID: 1000
      PGID: 1000
      TZ: Etc/UTC
      TITLE: Dotfiles #optional
    shm_size: "1gb" #optional
    working_dir: /config/.dotfiles
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock #optional
      - arch-kde-home:/config
      - arch-kde-workspace:/config/.dotfiles

volumes:
  arch-kde-home:
  arch-kde-workspace:
```

## 2. Extendable Configuration: `docker-compose.extend.yml`

The `docker-compose.extend.yml` file is an example of how to extend the default configuration. It demonstrates how to run the development container in the network of another container, such as a WireGuard client.

### Key Features:
- Sets the `network_mode` to use the network of the `wg-devcontainer-client` container.
- Useful for scenarios where the development container needs to share the network stack with another container.

### Example:
```yaml
services:
  arch-kde:
    network_mode: "container:wg-devcontainer-client"
```

## 3. Environment Variable: `DOCKER_COMPOSE_FILE`

The `DOCKER_COMPOSE_FILE` environment variable allows you to specify an additional Docker Compose configuration file to extend the default setup. This variable must be set in the host shell before starting the development container.

### Behavior:
- If `DOCKER_COMPOSE_FILE` is set, the specified file will be included in the configuration.
- If `DOCKER_COMPOSE_FILE` is not set, only the default `docker-compose.yml` file will be used.

### Example:
To use the `docker-compose.extend.yml` file:
```bash
export DOCKER_COMPOSE_FILE=docker-compose.extend.yml
```

## 4. How to Use

1. **Set the Environment Variable (Optional)**:
   If you want to use an extended configuration, set the `DOCKER_COMPOSE_FILE` variable in your host shell:
   ```bash
   export DOCKER_COMPOSE_FILE=docker-compose.extend.yml
   ```

2. **Open the Development Container**:
   Open the project in VSCode and select "Reopen in Container". The configuration will automatically include the specified file.

3. **Verify the Setup**:
   Check the logs to ensure that the extended configuration is applied correctly.

## 5. Notes
- The `docker-compose.extend.yml` file is just an example. You can create additional configuration files as needed.
- Ensure that the `DOCKER_COMPOSE_FILE` variable points to a valid file in the `.devcontainer` directory.

For more details, refer to the [Docker Compose documentation](https://docs.docker.com/compose/).
