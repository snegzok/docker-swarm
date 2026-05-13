# Centralized Log Management: 📊 Loki+Promtail Stack для Docker Swarm + SeaweedFS s3 storage 
## 🚀 start 

### 1. Create network - shared network<tempo-net> (grafana,loki+Promtail,SeaweedFS)

```bash
docker network create --driver overlay tempo-net
```
### 2. Create backet 
```bash
docker run --rm --network tempo-net curlimages/curl -X PUT http://seaweedfs_s3:8333/loki-logs/
```
### 3. Deploy 
```bash
docker stack deploy -c loki-stack.yml loki
```

