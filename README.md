# Kubernetes Practice - Node.js API

A simple Node.js Express API project designed for practicing Kubernetes deployment concepts, containerization with Docker, and DevOps workflows.

## 🚀 Project Overview

This project demonstrates:
- **Containerized Node.js application** using Docker
- **Kubernetes deployment** with multiple replicas
- **Health checks and readiness probes**
- **Environment variable configuration**
- **Automated deployment scripts**
- **Service exposure and networking**

## 📋 Prerequisites

Before running this project, ensure you have the following installed:

- [Node.js](https://nodejs.org/) (v18 or higher)
- [Docker](https://www.docker.com/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/) (Kubernetes CLI)
- Access to a Kubernetes cluster (local or cloud)
- [Docker Hub](https://hub.docker.com/) account (for pushing images)

## 🏗️ Project Structure

```
├── k8s/
│   ├── deployment.yaml      # Kubernetes deployment configuration
│   └── service.yaml         # Kubernetes service configuration
├── deploy.ps1              # PowerShell deployment script
├── deploy.sh               # Bash deployment script
├── docker-compose.yaml     # Docker Compose configuration
├── dockerfile              # Docker image definition
├── index.js                # Main Express application
├── package.json            # Node.js dependencies and scripts
└── kubectl.exe             # Kubernetes CLI (Windows)
```

## 🛠️ Installation & Setup

### 1. Clone and Install Dependencies

```bash
git clone <repository-url>
cd kubernetes-practice
npm install
```

### 2. Local Development

Run the application locally:

```bash
# Development with auto-reload
npm run dev

# Production mode
npm start
```

The API will be available at `http://localhost:3000`

## 🐳 Docker Usage

### Build and Run with Docker

```bash
# Build the Docker image
docker build -t kubernetes-practice-api .

# Run with Docker
docker run -p 3000:3000 kubernetes-practice-api
```

### Using Docker Compose

```bash
# Start the application
docker-compose up

# Build and start
docker-compose up --build

# Run in background
docker-compose up -d
```

## ☸️ Kubernetes Deployment

### Manual Deployment

```bash
# Apply Kubernetes manifests
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

# Check deployment status
kubectl get pods
kubectl get services
```

### Automated Deployment

#### Windows (PowerShell)
```powershell
# Run the deployment script
npm run deploy
# or
powershell -ExecutionPolicy Bypass -File deploy.ps1
```

#### Linux/MacOS (Bash)
```bash
# Make script executable
chmod +x deploy.sh

# Run deployment
./deploy.sh
```

### Deployment Features

- **2 replica pods** for high availability
- **Resource limits** (CPU: 500m, Memory: 512Mi)
- **Readiness probe** on `/readyz` endpoint
- **Liveness probe** on `/healthz` endpoint
- **NodePort service** for external access

## 📡 API Endpoints

### Health Check Endpoints

| Endpoint | Description | Response |
|----------|-------------|----------|
| `GET /` | Main endpoint with pod information | JSON with service details |
| `GET /healthz` | Health check endpoint | `200 OK` |
| `GET /readyz` | Readiness check endpoint | `200 OK` |

### Sample Response

```json
{
  "message": "Hello from container",
  "service": "heelo-node",
  "pod": "kubernetes-practice-api-7d8c9f5b6d-x1y2z",
  "time": "2025-09-28T10:30:00.000Z"
}
```

## 🔧 Configuration

### Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `PORT` | Application port | `3000` |
| `NODE_ENV` | Node.js environment | `production` |
| `POD_NAME` | Kubernetes pod name | `unknown` |

### Kubernetes Configuration

The deployment includes:
- **Replicas**: 2 pods for load distribution
- **CPU Requests**: 100m (minimum)
- **CPU Limits**: 500m (maximum)
- **Memory Requests**: 128Mi (minimum)
- **Memory Limits**: 512Mi (maximum)

## 🔍 Monitoring & Debugging

### Check Pod Status
```bash
kubectl get pods -l app=kubernetes-practice-api
```

### View Pod Logs
```bash
kubectl logs -l app=kubernetes-practice-api
```

### Describe Resources
```bash
kubectl describe deployment kubernetes-practice-api
kubectl describe service devops-kubernetes-api-service
```

### Port Forwarding (for testing)
```bash
kubectl port-forward svc/devops-kubernetes-api-service 3000:3000
```

## 🚨 Troubleshooting

### Common Issues

1. **Image Pull Errors**
   - Ensure Docker image exists in registry
   - Check image name and tag in deployment.yaml

2. **Pod Not Ready**
   - Check readiness probe endpoint `/readyz`
   - Verify application is listening on correct port

3. **Service Not Accessible**
   - Confirm service selector matches deployment labels
   - Check NodePort or LoadBalancer configuration

### Debugging Commands

```bash
# Check all resources
kubectl get all

# Describe problematic pod
kubectl describe pod <pod-name>

# Check events
kubectl get events --sort-by=.metadata.creationTimestamp

# Access pod shell
kubectl exec -it <pod-name> -- sh
```

## 📚 Learning Objectives

This project helps you practice:

- ✅ **Docker containerization** best practices
- ✅ **Multi-stage Docker builds** with optimization
- ✅ **Kubernetes deployments** and services
- ✅ **Health checks** and probes configuration
- ✅ **Resource management** and limits
- ✅ **Environment variable** injection
- ✅ **DevOps automation** scripts
- ✅ **Service discovery** and networking

## 🛡️ Security Considerations

- Application runs as non-root user in container
- Resource limits prevent resource exhaustion
- Health checks ensure only healthy pods serve traffic
- Environment-specific configurations

## 📈 Next Steps

Consider extending this project with:

- **Horizontal Pod Autoscaler (HPA)**
- **Ingress controllers** for advanced routing
- **ConfigMaps and Secrets** for configuration
- **Persistent volumes** for data storage
- **Monitoring** with Prometheus and Grafana
- **Continuous Integration/Deployment** pipelines

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test locally and with Kubernetes
5. Submit a pull request

## 📄 License

This project is licensed under the ISC License.

