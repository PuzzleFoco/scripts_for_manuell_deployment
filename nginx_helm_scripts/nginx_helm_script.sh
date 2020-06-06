#!/bin/bash

helm repo add nginx-stable https://helm.nginx.com/stable
helm repo update
kubectl create namespace nginx
helm upgrade nginx-webserver nginx-stable/nginx-ingress \
    --namespace nginx \
    --set controller.service.enabled=true \
    --set controller.defaultTLS.secret=cert-manager/wildcard \
    --set controller.wildcardTLS.secret=cert-manager/wildcard \
    --set controller.service.loadBalancerIP=<IP-Adresse> \
    --set controller.service.annotations.'service\.beta\.kubernetes\.io/azure-load-balancer-resource-group'=DNSResourceGroup
curl www.masterthesis.online

# 5 Befehle