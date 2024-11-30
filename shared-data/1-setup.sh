#!/usr/bin/env bash

set +ex

# Restore apt remotes
apt-get update

# Helpers
apt-get install -y \
  apt-transport-https \
  curl \
  nmap

# Hostname per node
cat /vagrant-data/all/hosts >> /etc/hosts

# Start kernet modules
cp /vagrant-data/all/containerd.conf /etc/modules-load.d/containerd.conf
modprobe overlay
modprobe br_netfilter

# Enable IPv4 and IPv6 bridge and forwarding
cp /vagrant-data/all/99-k8s-cri.conf /etc/sysctl.d/99-k8s-cri.conf
sysctl --system

# Get and configure Containerd
apt-get install -y containerd
mkdir -p /etc/containerd
containerd config default > /etc/containerd/config.toml

# No swap
swapoff -a

# Add Kube apt repo
# curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | \
#   gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
# curl -s https://dl.k8s.io/apt/doc/apt-key.gpg | \
#   sudo apt-key add -
# curl -s https://dl.k8s.io/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 234654DA9A296436
cp /vagrant-data/all/kubernetes.list /etc/apt/sources.list.d/kubernetes.list

# Download Apt repo
apt-get update

# Install Kube stable-1.25
apt-get install -y \
  kubelet \
  kubeadm \
  kubectl

apt-mark hold \
  kubelet \
  kubeadm \
  kubectl
