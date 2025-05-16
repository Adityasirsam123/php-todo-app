Kubeadm Kubernetes Cluster Setup Guide

Step 1: On Master Node Only

Install Containerd

sudo wget https://raw.githubusercontent.com/lerndevops/labs/master/scripts/installContainerd.sh -P /tmp
sudo bash /tmp/installContainerd.sh
sudo systemctl restart containerd.service

Install kubeadm, kubelet, kubectl

sudo wget https://raw.githubusercontent.com/lerndevops/labs/master/scripts/installK8S.sh -P /tmp
sudo bash /tmp/installK8S.sh

Initialize Kubernetes Master Node

sudo kubeadm init --ignore-preflight-errors=all

sudo mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

Install Networking Driver (Calico)

kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.24.1/manifests/calico.yaml

Validate the Setup

kubectl get nodes

Step 2: On All Worker Nodes

Install Containerd

sudo wget https://raw.githubusercontent.com/lerndevops/labs/master/scripts/installContainerd.sh -P /tmp
sudo bash /tmp/installContainerd.sh
sudo systemctl restart containerd.service

Install kubeadm, kubelet, kubectl

sudo wget https://raw.githubusercontent.com/lerndevops/labs/master/scripts/installK8S.sh -P /tmp
sudo bash /tmp/installK8S.sh

Join Worker Nodes to the Cluster

Run the following on the master node to get the join command:

kubeadm token create --print-join-command

Copy the output and run it on each worker node. Example:

kubeadm join 10.128.15.231:6443 --token mks3y2.v03tyyru0gy12mbt \
    --discovery-token-ca-cert-hash sha256:3de23d42c7002be0893339fbe558ee75e14399e11f22e3f0b34351077b7c4b56

