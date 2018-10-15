#!/bin/bash

if [ -n $1 ];then 
	IP=$1
	ENDPOINT=$2
	ipflag=$3
    IP_VALUE=""
	if [ $ipflag -eq 4 ];then
		ping -w3 -c3 -i0.01 $IP > /dev/null; AA=$?
	else
		ping6 -w3 -c3 -i0.01 $IP > /dev/null; AA=$?
	fi
	if [ $AA -ne 0 ];then
		IP_VALUE=0
	else
		IP_VALUE=1
	fi
	STEP=600
	ts=`date +%s`	
	jsonData="[{\"metric\": \"leap6-ip-status-chongqi\", \"endpoint\": \"$ENDPOINT\", \"timestamp\": $ts,\"step\": $STEP,\"value\": $IP_VALUE,\"counterType\": \"GAUGE\",\"tags\": \"leap6.ip=status\"}]"
		
	curl -X POST -d "$jsonData" http://127.0.0.1:1988/v1/push
#	echo "$IP--------------$Time"
fi
exit 0
