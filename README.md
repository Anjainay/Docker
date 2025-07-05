
# 🚀 Docker-Only Full Stack Project (Node.js + MongoDB + Nginx)

This project is a **full-stack web application** built and run **entirely using Docker CLI**, **without Docker Compose** or any external orchestrators.

It demonstrates how to run a **Node.js + Express backend**, a **MongoDB database**, and a **static frontend (HTML+JavaScript) with Nginx**, all containerized and networked manually via Docker.

---

## 📦 Tech Stack

| Layer            | Technology              |
| ---------------- | ----------------------- |
| Frontend         | HTML, JavaScript, Nginx |
| Backend          | Node.js, Express        |
| Database         | MongoDB                 |
| Containerization | Docker (CLI only)       |

---

## 🧱 Project Structure

```
docker-only-project/
├── backend/
│   ├── Dockerfile
│   └── server.js
├── frontend/
│   ├── Dockerfile
│   └── index.html
└── README.md
```

---

## 🔧 Architecture Overview

### 🔗 Docker Network: `docker-net`

All containers are connected via a custom Docker bridge network to allow internal DNS resolution between services.

```
                         +-------------------+
                         |     Browser       |
                         |-------------------|
                         |  http://<EC2>:8080|
                         +--------+----------+
                                  |
                                  v
                         +-------------------+
                         |   Frontend (Nginx)|
                         |   Exposed: 8080   |
                         +-------------------+
                                  |
                                  v
                         +-------------------+
                         |  Backend (Node.js)|
                         |   Exposed: 3000   |
                         +-------------------+
                                  |
                                  v
                         +-------------------+
                         |   MongoDB         |
                         |   Internal: 27017 |
                         +-------------------+
```

---

## 🌐 How It Works

1. **Frontend** is served by **Nginx** and provides a static `index.html` page.
2. The page makes a **fetch call** to `http://<EC2_PUBLIC_IP>:3000/api/items`.
3. **Backend** (Node.js + Express) handles the API request, connects to **MongoDB**, and returns a list of items in JSON.
4. Data is dynamically rendered on the frontend via JavaScript.

---

## 🚀 Getting Started (CLI-Only Setup)

### Step 1: Create Docker Network

```bash
docker network create docker-net
```

### Step 2: Run MongoDB

```bash
docker run -d --name mongodb --network docker-net mongo
```

### Step 3: Build & Run Backend

```bash
docker build -t my-backend ./backend
docker run -d --name backend --network docker-net -p 3000:3000 my-backend
```

### Step 4: Build & Run Frontend

```bash
docker build -t my-frontend ./frontend
docker run -d --name frontend --network docker-net -p 8080:80 my-frontend
```

---

## 🌐 Access the App

* Frontend: [http://<your-ec2-ip>:8080](http://<your-ec2-ip>:8080)
* Backend API: [http://<your-ec2-ip>:3000/api/items](http://<your-ec2-ip>:3000/api/items)

> Make sure your EC2 security group allows inbound on ports 8080 and 3000.

---

## 📄 Features

* Simple CRUD-ready backend with MongoDB
* Dynamic data fetching on frontend
* Fully containerized via **Docker CLI**
* No `docker-compose`, Kubernetes, or third-party tooling

---

## ✅ Prerequisites

* Docker installed
* Public cloud VM (e.g., AWS EC2)
* Port 8080 and 3000 opened in security group/firewal



