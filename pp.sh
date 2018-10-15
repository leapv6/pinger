#!/bin/bash

while read IPstr
do
	#echo $IPstr
	#echo '__________________________';
	ipaddress=""
	endpoint=""
	ipflag=""
	i=1
	while((1==1))
	do
		split=`echo $IPstr|cut -d "|" -f$i`
		if [ "$split" != "" ]
		then
			case $i in
				1 )
					ipaddress=$split 
					;;
				2 )
					endpoint=$split 
					;;
				3 )
					ipflag=$split 
					;;
				*)
					exit 1
					;;
			esac	
			((i++))
		else
			break;
		fi
	done
	#echo $IPstr
	#echo $ipaddress
	#echo $endpoint
	#echo $ipflag
	./Ping.sh $ipaddress $endpoint $ipflag &
	sleep 0.1
done < ip.txt2
