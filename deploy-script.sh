#!/bin/bash
docker build -t $DOCKER_USERNAME/docker-ansible:latest .
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker push $DOCKER_USERNAME/docker-ansible:latest