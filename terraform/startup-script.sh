#!/bin/bash
set -e

# Update and install packages
apt-get update -y
apt-get install -y curl

# Install Docker (optional)
curl -fsSL https://get.docker.com | sh

# Install k3s
curl -sfL https://get.k3s.io | sh -

# Wait for k3s to be ready
sleep 30

# Set up kubeconfig for ubuntu user
sudo mkdir -p /home/ubuntu/.kube
sudo cp /etc/rancher/k3s/k3s.yaml /home/ubuntu/.kube/config
sudo chown ubuntu:ubuntu /home/ubuntu/.kube/config
sudo chmod 600 /home/ubuntu/.kube/config

# Export KUBECONFIG for current session
export KUBECONFIG=/home/ubuntu/.kube/config

# Print k3s cluster status
kubectl get nodes
kubectl cluster-info
