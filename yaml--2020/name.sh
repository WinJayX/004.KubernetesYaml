#!/bin/bash
while read line
do
kubectl delete -n ingress-nginx pods  --force --grace-period=0 "$line"

done < $1
