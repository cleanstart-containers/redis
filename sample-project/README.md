# Sample Project: cleanstart/redis:latest-dev

This folder showcases how to run and use the **cleanstart/redis:latest-dev** Docker image.

## 1. Pull the image

```bash
docker pull cleanstart/redis:latest-dev
```

## 2. Run with Docker

### Basic run (interactive)

```bash
docker run -it --name redis-sample cleanstart/redis:latest-dev
```

### Run in background with persistence and port

```bash
docker run -d --name redis-sample \
  -p 6379:6379 \
  -v redis-sample-data:/data \
  --security-opt=no-new-privileges \
  --user 1000:1000 \
  --restart unless-stopped \
  -e ENV=development \
  -e LOG_LEVEL=info \
  cleanstart/redis:latest-dev
```

### With a host directory for data

```bash
docker run -d --name redis-sample \
  -p 6379:6379 \
  -v "$(pwd)/data:/data" \
  cleanstart/redis:latest-dev
```

Redis will be available on **localhost:6379**.

### Stop and remove

```bash
docker stop redis-sample
docker rm redis-sample
# To remove the named volume as well: docker volume rm redis-sample-data
```

## 3. Test the connection

With Redis running:

```bash
docker exec -it redis-sample redis-cli ping
# Expected: PONG

docker exec -it redis-sample redis-cli SET mykey "Hello Redis"
docker exec -it redis-sample redis-cli GET mykey
```

## 4. Add and view data

**Add data**

```bash
# Set a string value
docker exec -it redis-sample redis-cli SET greeting "Hello from Redis"

# Add a key with expiry (optional, in seconds)
docker exec -it redis-sample redis-cli SETEX session:abc 3600 "user-data"
```

**View data**

```bash
# Get a value by key
docker exec -it redis-sample redis-cli GET greeting

# List all keys (use in development only; prefer SCAN in production)
docker exec -it redis-sample redis-cli KEYS "*"
```

## 5. Configuration

| Variable   | Default      | Description          |
|-----------|--------------|----------------------|
| `ENV`     | production   | Environment mode     |
| `LOG_LEVEL` | info      | Logging level        |

Pass with `-e` when using `docker run`, e.g. `-e ENV=development -e LOG_LEVEL=info`.

## 6. Production-style run

```bash
docker run -d --name redis-sample \
  --security-opt=no-new-privileges \
  --user 1000:1000 \
  --restart unless-stopped \
  -p 6379:6379 \
  -v redis-data:/data \
  -e ENV=production \
  -e LOG_LEVEL=info \
  cleanstart/redis:latest-dev
```