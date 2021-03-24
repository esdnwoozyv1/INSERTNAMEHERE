#!/bin/bash
#
# This script automates initial enumeration.
#
#
figlet FragRecon
printf "\n\e[1;31mWelcome to ###(InsertNameHere)###\e[0m\n"
printf  "\n###(InsertNameHere)### is an automation script that performs Initial Enumeration...\n"
printf "\n"
read -p "Please Enter an IP Address or Range: " ip
printf "\nScanning $ip commencing...\n"
nmap -A $ip > scan_$ip.txt
printf  "\nScanning Complete on $ip\n"
printf "\nWould you like to proceed with vulnerabiltiy scanning?\n"
read -p 'yes or no: ' answer
        if [[ $answer = y ]] ; then
        echo "Vulnerability Scan Initiated..."
        nikto -host $ip >> scan_$ip.txt
        elif [[ $answer = n ]] ;
        echo "Exiting FragRecon..."
        exit

#        case $yn in
#                [Yy]* ) nikto -host http://$ip >> scan_$ip.txt;
#               [Nn]*  exit;;
#              * ) echo "Exiting...";
#     esac

#gobuster dir -u http://$ip -w /usr/share/wordlists/dirb/common.txt
#nikto -host http://$ip
