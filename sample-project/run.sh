#!/usr/bin/env bash
# Quick start: pull image and run with Docker

set -e
cd "$(dirname "$0")"

CONTAINER_NAME="redis-sample"
IMAGE="cleanstart/redis:latest-dev"

echo "Pulling $IMAGE..."
docker pull "$IMAGE"

# Remove existing container if present
docker rm -f "$CONTAINER_NAME" 2>/dev/null || true

echo "Starting Redis..."
docker run -d --name "$CONTAINER_NAME" \
  -p 6379:6379 \
  -v redis-sample-data:/data \
  -e ENV=development \
  -e LOG_LEVEL=info \
  "$IMAGE"

echo "Waiting for Redis to be ready..."
sleep 2
docker exec -it "$CONTAINER_NAME" redis-cli ping

echo "Redis is running on localhost:6379"
echo "  Logs: docker logs -f $CONTAINER_NAME"
echo "  Stop: docker stop $CONTAINER_NAME && docker rm $CONTAINER_NAME"
