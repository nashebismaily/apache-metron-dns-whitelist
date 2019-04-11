#!/bin/bash

## Auhtor: Nasheb Ismaily
## Description:
## 1. Splits the nameserver file into smaller files
## 2. Move the files into specified split directories

NAMESERVER_FILE=good_nameservers.csv
LINES_PER_FILE=1
TOTAL_DIRECTORIES=5

mkdir -p dns_good_split
cp ${NAMESERVER_FILE} dns_good_split/

current_dir=${pwd)
cd dns_good_split
split -l ${LINES_PER_FILE}
rm -rf ${NAMESERVER_FILE}
cd ${current_dir}

count=0

for filename in dns_good_split/*
do
   mkdir -p dns_good_split/${count}
   mv ${filename} dns_good_split/${count}
   count=$((count+1))
  
   if [ "${count}" -eq "${TOTAL_DIRECTORIES}" ]; then
     count=0
fi

done
