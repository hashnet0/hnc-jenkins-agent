#!/bin/bash

# Set the directory to this script's current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

source ./settings.sh

docker run --rm -i -t \
	-e CONTAINER_NAME=${CONTAINER_NAME} \
	-e MAX_MEMORY=${MAX_MEMORY} \
	-e CPUS=${CPUS} \
	-e PASSWORD=${PASSWORD}
	--memory=${MAX_MEMORY} \
	--memory-swap=${MAX_MEMORY} \
	--memory-swappiness="0" \
	--cpus=${CPUS} \
	${IMAGE_NAME} bash

