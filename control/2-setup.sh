#!/usr/bin/env bash

kubeadm config images pull

kubeadm init \
    --apiserver-advertise-address 192.168.56.10 \
    --pod-network-cidr=10.20.0.0/16

    #--control-plane-endpoint 192.168.56.10

bash /vagrant-data/control/config.sh

# Check kubectl works
kubectl get nodes

# Install Calico
# https://docs.tigera.io/calico/latest/getting-started/kubernetes/quickstart
# kubectl create -f /vagrant-data/control/tigera-operator.yaml
# kubectl create -f /vagrant-data/control/custom-resources.yaml
kubectl create -f /vagrant-data/control/calico.yaml

# Remove Control plane taints
kubectl taint nodes --all node-role.kubernetes.io/control-plane-

# Print the token to use in joining workers
kubeadm token create --print-join-command > /vagrant-data/all/join-cluster.sh
