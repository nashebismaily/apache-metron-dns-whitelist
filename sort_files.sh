#!/bin/bash

## Auhtor: Nasheb Ismaily
## Description:
## 1. Sorts the file, then creates a new one with unique values

FILE_PART=$1
ORIGINAL_FILE="host_ip_top_10k.csv"
SORTED_FILE="host_ip_top_10k_part${FILE_PART}.csv"

sort ${ORIGINAL_FILE} | uniq > ${SORTED_FILE}
