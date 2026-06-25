## End-to-End DevOps CI/CD Pipeline of React based E-commerece application using Docker, Jenkins, GitHub & Docker Hub

## Project Overview

This project demonstrates the implementation of a complete DevOps CI/CD pipeline that automates the software delivery lifecycle from source code commit to deployment.

The pipeline integrates **GitHub**, **Jenkins**, **Docker**, **Docker Hub**, and **Docker Compose** to achieve Continuous Integration and Continuous Deployment (CI/CD) with automated image management and deployment workflows.

---

## Objectives

* Containerize a web application using Docker.
* Automate image build and push processes.
* Implement CI/CD using Jenkins pipelines.
* Integrate GitHub with Jenkins using Webhooks.
* Manage Docker images through Docker Hub.
* Implement image promotion from Development to Production.
* Automate application deployment using Docker Compose.

---

## Architecture

```text
Developer
    │
    ▼
GitHub Repository
    │
    │ (Webhook Trigger)
    ▼
Jenkins Pipeline
    │
    ├── Checkout Source Code
    ├── Build Docker Image
    ├── Push to Dev Repository
    ├── Manual Approval
    ├── Promote Image
    ├── Push to Prod Repository
    └── Deploy Application
            │
            ▼
      Running Application
```

---

## Technology Stack

| Component          | Technology     |
| ------------------ | -------------- |
| Source Control     | GitHub         |
| CI/CD Tool         | Jenkins        |
| Containerization   | Docker         |
| Container Registry | Docker Hub     |
| Deployment         | Docker Compose |
| Web Server         | Nginx          |
| Automation         | Shell Script   |
| Operating System   | Linux          |

---

## Project Structure

```text
project-3-devops/
│
├── Dockerfile
├── Jenkinsfile
├── build.sh
├── docker-compose.yml
├── build/
│   └── Application Files
│
└── README.md
```

---

## Docker Configuration

### Dockerfile

```dockerfile
FROM nginx:alpine

COPY build/ /usr/share/nginx/html

EXPOSE 80

CMD ["nginx","-g","daemon off;"]
```

### Build Docker Image

```bash
docker build -t project3:v1 .
```

### Run Container

```bash
docker run -d -p 8081:80 project3:v1
```

### Access Application

```text
http://localhost:8081
```

---

## Docker Hub Integration

### Login

```bash
docker login
```

### Tag Image

```bash
docker tag project3:v1 <dockerhub-username>/project3:v1
```

### Push Image

```bash
docker push <dockerhub-username>/project3:v1
```

---

## Build Automation Script

### build.sh

```bash
#!/bin/bash

IMAGE_NAME="raguraaman/project-3-devops-build"
TAG="v1"

echo "Building image..."
docker build -t $IMAGE_NAME:$TAG .

echo "Pushing image..."
docker push $IMAGE_NAME:$TAG

echo "Build completed."
```

---

## Docker Compose Deployment

### docker-compose.yml

```yaml
version: '3'

services:
  web:
    image: <dockerhub-username>/project3:v1
    ports:
      - "8081:80"
```

### Deploy Application

```bash
docker compose up -d
```

### Verify Running Containers

```bash
docker ps
```

---

##  GitHub Integration

### Initialize Repository

```bash
git init

git add .

git commit -m "Initial Commit"

git branch -M main

git remote add origin <repository-url>

git push -u origin main
```

---

## Jenkins CI/CD Pipeline

### Pipeline Workflow

1. Checkout Source Code
2. Build Docker Image
3. Push Image to Development Repository
4. Manual Approval Stage
5. Promote Image
6. Push Image to Production Repository
7. Deploy Application

### Sample Approval Stage

```groovy
input "Approve Image Promotion?"
```

### Deployment Stage

```groovy
docker compose up -d
```

---

## Docker Hub Credentials in Jenkins

Configure Docker Hub credentials in Jenkins:

```text
Manage Jenkins
 └── Credentials
      └── Global Credentials
```

Store:

* Docker Hub Username
* Docker Hub Personal Access Token (PAT)

---

## GitHub Webhook Integration

Configure GitHub Webhook:

```text
Repository Settings
 └── Webhooks
      └── Add Webhook
```

### Payload URL

```text
http://<jenkins-server>:8080/github-webhook/
```

### Event Type

```text
Push Events
```

This enables automatic Jenkins pipeline execution whenever code is pushed to GitHub.

---

## Pull Request Workflow

```bash
git checkout -b feature-update

git add .

git commit -m "Feature Added"

git push origin feature-update
```

Workflow:

```text
Create Feature Branch
        ↓
Commit Changes
        ↓
Push Branch
        ↓
Create Pull Request
        ↓
Review & Approve
        ↓
Merge to Main
```

---

## Results Achieved

* Dockerized web application deployment.
* Automated Docker image build and push process.
* CI/CD pipeline implementation using Jenkins.
* GitHub and Jenkins webhook integration.
* Development and Production image repositories.
* Manual approval-based image promotion.
* Automated deployment using Docker Compose.
* Pull-request-based development workflow.



---

## Conclusion

This project successfully demonstrates an end-to-end DevOps CI/CD implementation using Docker, Jenkins, GitHub, Docker Hub, and Docker Compose. The pipeline automates application delivery from code commit to deployment, improves release reliability, reduces manual intervention, and follows modern DevOps best practices.

---

## Author

## Raguraaman V M
