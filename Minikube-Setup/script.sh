#!/bin/bash
sudo yum install curl wget -y
wget -P /etc/yum.repos.d/ https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker -y
sudo systemctl enable docker 
sudo systemctl start docker 
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-latest.x86_64.rpm
sudo rpm -ivh minikube-latest.x86_64.rpm
minikube start --driver=docker
sudo usermod -aG docker $USER && newgrp docker
minikube start --driver=docker
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
chmod +x ./kubectl
mkdir -p ~/.local/bin/kubectl
mv ./kubectl ~/.local/bin/kubectl
kubectl version --client
