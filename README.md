# HashNet Container for Jenkins Agents (slave)

This Docker image generates slave containers for Jenkins builds.

The following dependencies will automatically be built in the container:

- Java 11 (OpenJDK 11)
- Git
- Maven

### 1. Configure image

Configure `settings.sh` for container configuration.

### 2. Build the image

Run the `build.sh` file to generate the Docker image settings specified in `settings.sh`.

### 2. Deploy the container

To spawn a temporary container run `test.sh`.

To spawn a persistent container execute `run.sh` which will utilize the configuration settings in `settings.sh`.

