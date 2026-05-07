# Grafana Tempo + SeaweedFS S3 — Production Tracing Stack for Docker Swarm

A production-ready distributed tracing stack using **Grafana Tempo** and **SeaweedFS** as S3-compatible storage for Docker Swarm.

---
## 🚀 Quick Start

### 1. Create overlay networks

```bash
docker network create --driver overlay --attachable tempo-net
docker network create --driver overlay --attachable monitoring
```
### 2. Deploy SeaweedFS (S3 storage)
```bash
docker stack deploy -c seaweedf-stack.yml seaweedfs
```
### 3. Create S3 bucket for traces
```bash
chmod +x s3_bucket.sh
./s3_bucket.sh
```
### 4. Deploy Grafana Tempo
```bash
docker stack deploy -c tempo-stack.yml tempo
```
🧠 Production Notes
S3 authentication is ENABLED via s3_config.json

Bucket is created explicitly — do not rely on lazy creation

Search by service.name works only after adding overrides and restarting Tempo

Tempo and Grafana must be in the same network (monitoring) for proper communication

