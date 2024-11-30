#!/usr/bin/env bash

mkdir -p $HOME/.kube
cp /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config
cp $HOME/.kube/config /vagrant-data/control/