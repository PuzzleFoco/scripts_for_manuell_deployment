#!/bin/bash

helm delete jenkins --namespace jenkins
kubectl delete clusterrolebinding jenkins-service-account-binding
kubectl delete serviceaccount jenkins-service-account
kubectl delete namespace jenkins