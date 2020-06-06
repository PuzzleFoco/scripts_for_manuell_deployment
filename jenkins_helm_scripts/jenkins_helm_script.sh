#!/bin/bash

kubectl create namespace jenkins
kubectl create serviceaccount jenkins-service-account
kubectl create clusterrolebinding jenkins-service-account-binding --clusterrole=edit --serviceaccount=default:jenkins-service-account
export TOKENNAME=`kubectl get serviceaccount/jenkins-service-account -o jsonpath='{.secrets[0].name}'`
export TOKEN=`kubectl get secret $TOKENNAME -o jsonpath='{.data.token}' | base64 --decode`
helm upgrade jenkins -f jenkinsvalues.yaml stable/jenkins \
    --namespace jenkins \
    --version 1.7.1 

#6 Befehle