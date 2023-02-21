#!/bin/sh

# 인그레스 컨트롤러를 통해 서비스할 레플리카셋, 노드 포트 서비스 생성
echo "kubectl create -f myapp-rs.yaml -f myapp-svc-np.yaml"
kubectl create -f myapp-rs.yaml \
               -f myapp-svc-np.yaml

# 인그레스 컨트롤러를 위한 TLS 키 생성
echo "openssl genrsa -out ingress-tls/ingress-tls.key 2048"
openssl genrsa -out ./ingress-tls.key 2048

# 인그레스 컨트롤러를 위한 TLS 인증서 생성

openssl req -new -x509 -key ingress-tls.key \
--key=ingress-tls.key \
--cert=ingress-tls.crt

# TLS 키 및 인증서를 위한 시크릿 생성
kubectl create sercret tls ingress-tls-secret \
--key=ingress-tls.key \
--cert=ingress-tls.crt 

# 인증서와 키가 시크릿에 저장되었는지 확인
kubectl describe secret ingress-tls-secret
echo
echo

# TLS 종료 프록시 기능의 인드레스 컨트롤러 생성
kubectl create -f myapp-ing-tls-term.yaml

# TLS 종료 프록시 기능의 인그레스 컨트롤러가 제대로 생성되었는지 확인
kubectl get ingresse.networking.k8s.io
echo
echo

echo "Environment of Scenario \"TLS termination proxy by Ingress Controller\" has been succesfully constructed."

echo "You must have running ingress in current kubernetes cluster."
echo "Please check whether ingresses is running."
echo ""

kubectl get ingresses

# ing
echo "You can access Ingress Controller(=HTTPS TLS Termination Proxy) by following command."
echo "curl --rsolve myapp.example.com:443:<IngressController IP> \ "
echo ">-k -v https://<Ingress's .spec.rules.hosts>"
echo "example"
echo "curl --resolve myapp.example.com:443:192.168.56.201 -k -v https://myapp.example.com"

# ======================================================================
# cf) 왜 HTTPS '종료' 프록시일끼?
# 웹서버 앞단에서 HTTPS를 끊어준다는 뜻으로 종료 프록시라고 한다.
# '종단' 이라고 할 경우 end-to-end니까 서버가 끝까지 가져가는 느낌이 된다.

