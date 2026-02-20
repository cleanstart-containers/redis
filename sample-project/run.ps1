# Quick start: pull image and run with Docker (Windows PowerShell)

$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

$CONTAINER_NAME = "redis-sample"
$IMAGE = "cleanstart/redis:latest-dev"

Write-Host "Pulling $IMAGE..."
docker pull $IMAGE

# Remove existing container if present
docker rm -f $CONTAINER_NAME 2>$null

Write-Host "Starting Redis..."
docker run -d --name $CONTAINER_NAME `
  -p 6379:6379 `
  -v redis-sample-data:/data `
  -e ENV=development `
  -e LOG_LEVEL=info `
  $IMAGE

Write-Host "Waiting for Redis to be ready..."
Start-Sleep -Seconds 2
docker exec -it $CONTAINER_NAME redis-cli ping

Write-Host "Redis is running on localhost:6379"
Write-Host "  Logs: docker logs -f $CONTAINER_NAME"
Write-Host "  Stop: docker stop $CONTAINER_NAME; docker rm $CONTAINER_NAME"
