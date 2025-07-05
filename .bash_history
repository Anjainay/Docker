sudo apt-get update
sudo apt-get install git
sudo apt-get install docker.io
whoami
sudo mkdir DockerProject
sudo mkdir backend
sudo rm -r backend
cd DockerProject
sudo mkdir backend
ls
sudo mkdir frontend
ls
cd backend
sudo vi server.js
sudo vi Dockerfile
sudo cat server.js
cd ../
ls
cd frontend
ls
sudo vi index.html
sudo vi Dockerfile
sudo cat DockerFile
sudo cat Dockerfile
docker build -t my-frontend ./frontend
sudo docker build -t my-frontend ./frontend
sudo docker build -t frontendimage .
sudo docker  image
sudo docker images
cd ../
ls
cd backend
ls
cd DcokerProject
cd DockerProject
ls
cd backend
sudo docker build -t backendiamge .
sudo docker images
cd
cd DockerProject
ls
sudo docker network create --driver bridge my-network
cd backend
cd ../
docker run -d --name mongodb --network docker-net mongo
sudo docker run -d --name mongodb --network my-network mongo
cd backend
ls
sudo docker run -d --name C100 --network my-network backendimage
sudo docker images
