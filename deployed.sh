#!/bin/bash

IMAGE_NAME="bullshit-web-image"

#docker ps -a | grep -i ${CON_NAME} > /dev/null 2>&1 && docker stop ${CON_NAME} && docker rm ${CON_NAME}



docker build -t ${IMAGE_NAME} .
