#!/usr/bin/env bash

# wget https://raw.githubusercontent.com/projectcalico/calico/v3.29.1/manifests/tigera-operator.yaml -O ./control/tigera-operator.yaml
# wget https://raw.githubusercontent.com/projectcalico/calico/v3.29.1/manifests/custom-resources.yaml -O ./control/custom-resources.yaml
wget https://raw.githubusercontent.com/projectcalico/calico/v3.29.1/manifests/calico.yaml -O ./control/calico.yaml

# Non conflicting pod ip cidr
sed -i 's=# - name: CALICO_IPV4POOL_CIDR=- name: CALICO_IPV4POOL_CIDR=g' ./control/calico.yaml
sed -i 's=#   value: "192.168.0.0/16"=  value: "10.20.0.0/16"=g' ./control/calico.yaml
