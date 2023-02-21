#!/bin/sh

echo -n "Are you sure of cleaning Scenario \"TLS termination proxy by Ingress Controller\" environment(y/n)? "

while true; do

read yn

case $yn in
  y )
    kubectl get all;
    kubectl delete -f myapp-rs.yaml;
    kubectl delete -f myapp-svc-np.yaml;
    kubectl delete -f myapp-ing-tls-term.yaml;
    kubectl delete secret ingress-tls-secret;
    break;;
  n ) 
    echo "Cleaning up Scenario environment has been cancelled...";
    exit;;
  * ) echo "invalid choice";;
esac

done
