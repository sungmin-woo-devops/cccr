#!/bin/bash

# 헤드리스 서비스와 스테이트풀셋 리소스를 생성하자
kubectl create -f myapp-sts.yaml -f myapp-svc-headless.yaml

# 스테이트풀셋 리소스를 확인해보자.
kubectl get statefulset.apps

# 파드의 이름을 확인해보자.
kubectl get pods

# 스테이트룰셋의 복제본을 3개로 스케일링

