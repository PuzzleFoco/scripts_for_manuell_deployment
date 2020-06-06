#!/bin/bash

helm delete nginx-webserver --namespace nginx
kubectl delete namespace nginx