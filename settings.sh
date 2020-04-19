#!/bin/bash

# Docker image name
IMAGE_NAME="hnc-jenkins-agent:latest"

# The container's name when using ./run.sh
CONTAINER_NAME="hnc-jenkins-agent"

# The maximum memory this container is allowed
MAX_MEMORY="4096m"

# The cpu cores this container is allowed
CPUS="1"

# The password to use for the 'jenkins' user
PASSWORD="jenkins"
