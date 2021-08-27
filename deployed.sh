#!/bin/bash

IMAGE_NAME="bullshit-web-image"
CONTAINER_NAME="bullshit-web"
APP_PORT="9010"

docker ps -a | grep -i ${CONTAINER_NAME} > /dev/null 2>&1 && docker stop ${CONTAINER_NAME} && docker rm ${CONTAINER_NAME}

docker rmi ${IMAGE_NAME}

docker build -t ${IMAGE_NAME} .

docker run --name ${CONTAINER_NAME} -d -p ${APP_PORT}:80 ${IMAGE_NAME}