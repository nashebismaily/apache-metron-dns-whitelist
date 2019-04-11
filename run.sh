#!/bin/bash

## Auhtor: Nasheb Ismaily
## Description:
## 1. Recursivley looks throught the split nameservers folder
## 2. Launches a task in the background to perform nslook on the nameserver arcoss 10k domains

DNS_SPLIT_SUB_DIR=$1 

for filename in dns_good_split/${DNS_SPLIT_SUB_DIR}/*
do
   nohup ./dns_lookup.sh ${filename} &
done


