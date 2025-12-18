# 🚀 React Application Deployment with CI/CD (Dev → Prod)

This project demonstrates a **production-ready DevOps CI/CD pipeline** for deploying a React application using **Docker, Jenkins, AWS EC2, and open-source monitoring**.

The pipeline supports **branch-based workflows**, where:
- `dev` branch builds and pushes images to a **public Docker Hub repository**
- `master` branch builds and pushes images to a **private Docker Hub production repository**

---

## 📌 Project Overview

- Application: React (served via Nginx)
- CI/CD Tool: Jenkins
- Containerization: Docker & Docker Compose
- Cloud: AWS EC2 (t2.micro)
- Monitoring: Uptime Kuma (open-source)
- Alerts: Telegram / Email
- Version Control: GitHub (CLI only)

---

## 🏗️ Architecture

Developer → GitHub (dev branch)
↓
Jenkins CI
↓
Docker Build & Push
↓
Docker Hub (dev repo)
dev → master merge
↓
Jenkins PROD CI
↓
Docker Hub (private prod repo)
↓
AWS EC2 Deployment
↓
Monitoring & Alerting


---

## 📂 Repository Structure

.
├── Dockerfile
├── docker-compose.yml
├── build.sh
├── deploy.sh
├── .dockerignore
├── .gitignore
├── README.md
└── screenshots/

---

## 🐳 Docker Setup

### Dockerfile
- Uses `nginx:alpine`
- Serves React production build
- Exposes port **80**

### docker-compose.yml
- Runs the application on port **80**
- Simplifies local and server deployment

---

## 📜 Bash Scripts

### `build.sh`
- Detects branch using Jenkins environment variable
- Builds Docker image
- Pushes image to Docker Hub

| Branch | Docker Image |
|------|-------------|
| dev | `h4meed/dev:latest` |
| master | `h4meed/onlineshop-prod:latest` |

---

### `deploy.sh`
- Pulls latest image
- Stops and removes old container
- Runs container on port **80**

---

## 🔁 CI/CD with Jenkins

### DEV Pipeline
- Trigger: Push to `dev` branch
- Actions:
  - Build Docker image
  - Push to public Docker Hub repo

### PROD Pipeline
- Trigger: Merge `dev` → `master`
- Actions:
  - Build Docker image
  - Push to private Docker Hub prod repo

---

## 🐋 Docker Hub Repositories

- **DEV (Public)**  
h4meed/dev:latest

- **PROD (Private)**  
h4meed/onlineshop-prod:latest

---

## ☁️ AWS Deployment

- Instance Type: `t2.micro`
- Application runs on port **80**

### Security Group Rules

| Type | Port | Source |
|----|----|----|
HTTP | 80 | 0.0.0.0/0 |
SSH | 22 | My IP only |
Monitoring | 3001 | My IP only |

---

## 📊 Monitoring & Alerts

- Tool: **Uptime Kuma**
- Health checks on application URL
- Alerts triggered **only when application goes DOWN**
- Notification channels:
- Telegram
- Email

---

## 🌐 URLs

- **GitHub Repository**  
https://github.com/Hamsab31/Onlineshop-project

- **Deployed Application**  
http://<EC2_PUBLIC_IP>

- **Monitoring Dashboard**  
http://<EC2_PUBLIC_IP>:3001

---

## 📸 Screenshots

All required screenshots are available in the `screenshots/` directory:
- Jenkins jobs & console outputs
- Docker Hub repositories & tags
- AWS EC2 & Security Group configs
- Deployed application page
- Monitoring dashboard & alerts

---

## 🧠 Key Learnings

- Implemented branch-based CI/CD using Jenkins
- Understood Docker image lifecycle and tagging strategy
- Deployed containerized applications on AWS EC2
- Implemented open-source monitoring and alerting
- Resolved real-world Jenkins and Docker issues

---

## ✅ Conclusion

This project demonstrates an **end-to-end DevOps workflow**, covering CI/CD, containerization, cloud deployment, monitoring, and alerting using industry-standard tools.
