#!/bin/bash

az login
az ad sp create-for-rbac
az group create --name ResourceGroupForAKS --location westeurope
az aks create --resource-group ResourceGroupForAKS --name AKSForThesis --node-count 1 --service-principal <appId> --client-secret <password>
sudo az aks install-cli
az aks get-credentials --resource-group ResourceGroupForAKS --name AKSForThesis
kubectl get nodes

# 7 Befehle