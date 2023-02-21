#!/bin/sh

# 삭제할 오브젝트 manifest 파일 변수로 설정(나중에 배열로 확장)
files

echo "clean scenario env"

# 삭제할 오브젝트 리스트에서 받아와서 반복문으로 삭제
# 리소스 다르다면? manifest yaml 파일을 yq로 파싱하여 kind 부분에서 오브잭트 종류를 따와서
# if문으로 해당 값 분기 처리하여 삭제, else는 kubectl detete -f 명령어 진행 
kubectl delete -f template.yaml

echo "clean scenario completed."
