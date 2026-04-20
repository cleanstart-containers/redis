## Container Documentation for Redis Documentation

Redis is an open-source, in-memory data structure store used as a database, cache, message broker, and queue. It supports various data structures such as strings, hashes, lists, sets, and more. This enterprise-ready container provides a secure, optimized Redis deployment with advanced features for high availability, persistence, and monitoring.

📌 **Base Foundation**: Production-ready container from cleanstart.

**Image Path**: `redis`

**Registry**: `cleanstart`

## Key Features
Core capabilities and strengths of this container



## Common Use Cases
Typical scenarios where this container excels



## Pull Latest Image
Download the container image from the registry

```bash
docker pull ghcr.io/cleanstart-containers/redis:latest
```
```bash
docker pull ghcr.io/cleanstart-containers/redis:latest-dev
```

## Basic Run
Run the container with basic configuration

```bash
docker run -it --name redis-test ghcr.io/cleanstart-containers/redis:latest
```

## Production Deployment
Deploy with production security settings

```bash
docker run -d --name redis \
  --security-opt=no-new-privileges \
  --user 1000:1000 \
  --restart unless-stopped \
  ghcr.io/cleanstart-containers/redis:latest
```

Volume Mount Mount local directory for persistent data

```bash
docker run -v /app:/app ghcr.io/cleanstart-containers/redis:latest
```

Port Forwarding Run with custom port mappings

```bash
docker run -p 8080:8080 ghcr.io/cleanstart-containers/redis:latest
```

## Environment Variables
Configuration options available through environment variables

| Variable | Default | Description |
|----------|---------|-------------|
| ENV | production | Environment mode |
| LOG_LEVEL | info | Logging level |

## Security Best Practices
Recommended security configurations and practices



## Kubernetes Security Context
Recommended security context for Kubernetes deployments

```yaml
securityContext:
  allowPrivilegeEscalation: false
  capabilities:
    drop:
    - ALL
  readOnlyRootFilesystem: true
  runAsUser: 1000
  runAsGroup: 1000
```

## Documentation Resources
Essential links and resources for further information
 
**CleanStart Images**: https://images.cleanstart.com/
 
**Community Images**:<br>
**Docker Hub**: https://hub.docker.com/u/cleanstart<br>
**GitHub**: https://github.com/cleanstart-containers<br>
**AWS ECR Public Gallery**: https://gallery.ecr.aws/cleanstart/
 
**Presence on Social Media**:<br>
**Community**: https://www.linkedin.com/groups/18324021/<br>
**YouTube**: https://www.youtube.com/@CleanStartOfficial<br>
 
**Contribute to Container Use Cases**: https://github.com/cleanstart-dev/cleanstart-use-cases/
