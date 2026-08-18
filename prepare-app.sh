#!/bin/bash

echo "Preparing application..."

docker network create app-network 2>/dev/null || true

docker volume create mysql-data 2>/dev/null || true

docker build --network=host -t my-web-app ./app

echo "Application prepared successfully."
