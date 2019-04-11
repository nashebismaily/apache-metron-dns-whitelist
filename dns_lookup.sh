#!/bin/bash


## Auhtor: Nasheb Ismaily
## Description:
## 1. Loops through whitelist of nameservers. 
## 2. Loops through top 10k domains from alexa
## 3. Performs an NSlookup on the domain using the particular nameserver
## 4. Checks if the return is a valid IP
## 5. Outputs to a csv file

NAMESERVER_FILE=$1
DOMAINS_FILE=$2

OUTPUT_FILE=host_ip_top_10k.csv

while read nameserver
do
    server=$(echo ${nameserver} |cut -d ',' -f2 | tr -d ' '| tr -d " \t\n\r" | sed "s|\"||g" )
    echo "${server}"
    while read line
    do

      ip=$(echo ${line} |cut -d ',' -f2 | tr -d ' '| tr -d " \t\n\r" )
      
      nslookup_string=$(nslookup ${ip} ${server} | grep Address)

      echo "${nslookup_string}" | while IFS= read -r host
      do
	 nslookup_ip=$(echo ${host} | cut -d ":" -f 2 | tr -d ' ')

         if [[ ${nslookup_ip} =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
	     echo "${ip},${nslookup_ip}" >> host_ip_top_10k.csv

	 fi
      done
    done < ${DOMAINS_FILE}
done < ${NAMESERVER_FILE}
