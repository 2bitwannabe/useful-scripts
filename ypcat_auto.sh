#!/bin/bash
########################################
# Name: YPCat_Auto
# Version: 0.0.1
# Author: @2bitwannabe
# Desc: Help Automate Yellow Pages Enumeration during tests
# Notes: This is  a super Hacky McHackHack version 
# Dependencies: Kali Linux
# Usage:
# ./ypcat_auto.sh 
#
#########################################
echo -e "HOST Please: \c "
read  HOST

echo -e "NIS Domain Please: \c "
read  NIS

for SERVICE in passwd shadow hosts group rpc services netid protocols netgroup
do
	for QUERY in byname byhost byuser byuid byservicename bynumber
	do
		echo "ypcat -h $HOST -d $NIS $SERVICE.$QUERY"
		ypcat -h $HOST -d $NIS $SERVICE.$QUERY
	done
done
