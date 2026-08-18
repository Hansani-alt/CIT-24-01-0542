#!/bin/bash

echo "Removing application resources..."

docker rm -f web-app database 2>/dev/null || true

docker network rm app-network 2>/dev/null || true

docker volume rm mysql-data 2>/dev/null || true

docker rmi my-web-app 2>/dev/null || true

echo "Removed application."
