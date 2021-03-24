#!/bin/bash
#
# This script automates initial enumeration.
#
#
#
printf '\e[1;34m\e[m' "Welcome to ###(InsertNameHere)###\n"
printf  "###(InsertNameHere)### is an automation script that performs Initial Enumeration..."
read -p "Please Enter an IP Address or Range: " ip
printf "\nScanning $ip commencing...\n"
nmap -A $ip >> hosts.txt
printf  "\nScanning Complete on $ip\n"
printf "\nWould you like to proceed with vulnerabiltiy scanning?\n"
read -p 'yes or no: ' yn
        case $yn in
                [Yy]* ) nikto -host http://$ip >> nikto_vuln_$ip.txt;
                [Nn]*  exit;;
                * ) echo "Exiting...";;
        esac

#gobuster dir -u http://$ip -w /usr/share/wordlists/dirb/common.txt
#nikto -host http://$ip
