#!/bin/bash

echo "Running application..."

docker rm -f database 2>/dev/null || true
docker rm -f web-app 2>/dev/null || true

docker run -d \
  --name database \
  --network app-network \
  --restart on-failure \
  -p 3306:3306 \
  -e MYSQL_ROOT_PASSWORD=password \
  -e MYSQL_DATABASE=appdb \
  -v mysql-data:/var/lib/mysql \
  mysql:8.0

echo "Waiting for database..."

sleep 15

docker run -d \
  --name web-app \
  --network app-network \
  --restart on-failure \
  -p 5000:5000 \
  -e DB_HOST=database \
  -e DB_USER=root \
  -e DB_PASSWORD=password \
  -e DB_NAME=appdb \
  my-web-app

echo "Application is available at:"
echo "http://localhost:5000"
