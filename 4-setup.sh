#!/usr/bin/env bash

mkdir -p $HOME/.kube
cp ./control/config $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

sudo dnf install kubectl
