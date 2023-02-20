#!/bin/bash

##################################################################################################

echo "Executing MetalLB v0.10.3 installaion"
echo "[NOTIFICATION] You must construct Kubernetes first before running this script."

# if 문 추가할 자리

echo "Configuring metallb-system namespace"
kubectl create -f https://raw.githubusercontent.com/metallb/metallb/v0.10.3/manifests/namespace.yaml

echo "Installing metallb"
 kubectl create -f https://raw.githubusercontent.com/metallb/metallb/v0.10.3/manifests/metallb.yaml

echo "Checking whether metallb-system namespace,metallb are installed properly."
kubectl get namespaces | grep metallb-system
kubectl get all -n metallb-system

##################################################################################################

# 나중에 IP 대역대 현재 네트워크 반영하여 자동으로 범위 잡아줄 수 있게 수정
cat << EOF >> $PWD/metallb-config.yaml
kind: ConfigMap
metadata:
  namespace: metallb-system
  name: config
data:
  config: |
    address-pools:
    - name: default
      protocol: layer2
      addresses:
      - 192.168.56.200-192.168.56.210
EOF

##################################################################################################

echo "create IP pool for MetalLB LoadBalancer"
kubectl create -f $PWD/metallb-config.yaml

##################################################################################################

echo "Installation of MetalLB v0.10.3 is completed." 
echo "You can now use LoadBalancer Object in On-Premise Environment "

##################################################################################################

kubectl create -f https://raw.githubusercontent.com/metallb/metallb/v0.10.3/manifests/metallb.yaml
