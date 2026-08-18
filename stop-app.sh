#!/bin/bash

echo "Stopping application..."

docker stop web-app database 2>/dev/null || true

echo "Application stopped. Persistent data is preserved."
