Container Documentation for Redis Documentation

Redis is an open-source, in-memory data structure store used as a database, cache, message broker, and queue. It supports various data structures such as strings, hashes, lists, sets, and more. This enterprise-ready container provides a secure, optimized Redis deployment with advanced features for high availability, persistence, and monitoring.

📌 Base Foundation: Production-ready container from cleanstart.

Image Path: cleanstart/redis:latest Registry: Docker Hub

## Key Features
Core capabilities and strengths of this container



## Common Use Cases
Typical scenarios where this container excels



## Pull Latest Image
Download the container image from the registry

```bash
docker pull cleanstart/redis:latest
```
```bash
docker pull cleanstart/redis:6.2
```
```bash
docker pull cleanstart/redis:stable
```

## Basic Run
Run the container with basic configuration

```bash
docker run -it --name redis cleanstart/redis:latest
```

## Production Deployment
Deploy with production security settings

```bash
docker run -d --name redis-prod \
  --security-opt=no-new-privileges \
  --user 1000:1000 \
  --restart unless-stopped \
  cleanstart/redis:latest
```

## Volume Mount
Mount local directory for persistent data

```bash
docker run -v /app:/app cleanstart/redis:latest
```

## Port Forwarding
Run with custom port mappings

```bash
docker run -p 8080:8080 cleanstart/redis:latest
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

## Resources & Documentation
Essential links and resources for further information

Container Registry: https://www.cleanstart.com/
CleanStart Community Images: https://hub.docker.com/u/cleanstart
How-to-Run CleanStart images & sample projects: https://github.com/cleanstart-dev/cleanstart-containers
How to run sample projects using Dockerfile
How to deploy via Kubernetes YAML
How to migrate from public images to CleanStart images


## Vulnerability Disclaimer
CleanStart offers Docker images that include third-party open-source libraries and packages maintained by independent contributors. While CleanStart maintains these images and applies industry-standard security practices, it cannot guarantee the security or integrity of upstream components beyond its control.

Users acknowledge and agree that open-source software may contain undiscovered vulnerabilities or introduce new risks through updates. CleanStart shall not be liable for security issues originating from third-party libraries, including but not limited to zero-day exploits, supply chain attacks, or contributor-introduced risks.

Security remains a shared responsibility: CleanStart provides updated images and guidance where possible, while users are responsible for evaluating deployments and implementing appropriate controls.

