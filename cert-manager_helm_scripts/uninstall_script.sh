kubectl delete -f cert-managermanifest.yaml
kubectl delete secret secret-azure-config \
    --namespace cert-manager 
helm delete cert-manager --namespace cert-manager
kubectl delete namespace cert-manager
kubectl delete -f https://github.com/jetstack/cert-manager/releases/download/v0.15.0/cert-manager.crds.yaml