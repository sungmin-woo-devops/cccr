#!/bin/bash

# 다른 컨트롤러와 다르게 파드별 고유 상태를 가지기 위해 각 파드에 연결한 볼륨 클레임 템플릿을 선언한다.

# 볼륨 클레임 템플릿을 사용하는 스테이트풀셋 리소스 생성
kubectl create -f myapp-sts-vol.yaml

# 스테이트풀셋 리소스 확인
kubectl get statefulsets.apps myapp-sts-vol

# 파드 목록 확인
kubectl get pods -l app=myapp-sts-vol

# 파드의 상세정보에서 볼륨 관련 정보 확인
kubectl describe pods myapp-sts-vol-0

# PVC 리소스 확인
kubectl get persisentvolumeclaims

# PV 리소스 확인
kubectl get persistentvolume

# 복제본 3개로 스케일링
kubectl scale statefulset myapp-sts-vol --replicas=3

# 스테이트풀셋과 파드 목록 확인
kubectl get statefulsets.apps myapp-sts-vol

# 컨트롤러 및 서비스 리소스 정

# 컨트롤러 및 파드가 종료된 후 PV 및 PVC 소스를 다시 확인


