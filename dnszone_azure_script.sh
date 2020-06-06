#!/bin/bash

az group create --name DNSResourceGroup --location westeurope
az network dns zone create --resource-group DNSResourceGroup --name masterthesis.online
az network public-ip create --name publicIP --resource-group DNSResourceGroup --allocation-method Static --sku standard
az network dns record-set a add-record -g DNSResourceGroup -z masterthesis.online -n * -a <IP-Adresse>
nslookup www.masterthesis.online

# 5 Befehle