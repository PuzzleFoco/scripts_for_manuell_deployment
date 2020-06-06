#!/bin/bash

helm repo add jetstack https://charts.jetstack.io
helm repo update
kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v0.15.0/cert-manager.crds.yaml
kubectl create namespace cert-manager
helm install cert-manager jetstack/cert-manager \
    --namespace cert-manager \
    --version v0.15.0 \
    --set installCRDs=false
kubectl create secret generic secret-azure-config \
    --namespace cert-manager \
    --from-literal=password='<password>'
kubectl apply -f cert-managermanifest.yaml --validate=false

# 7 Befehle