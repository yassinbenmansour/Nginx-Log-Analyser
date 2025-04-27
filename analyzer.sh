#!/bin/bash

# Define your file log here 

LOG_FILE="access.log"

# Top 5 IP addresses with the most requests

echo "Top 5 IP addresses with the most requests:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | awk '{print $2 " - " $1 " requests"}'
echo ""

# Top 5 most requested paths

echo "Top 5 most requested paths:"
awk '{print $7}' "$LOG_FILE" | grep -vE "^/v1-health$|^/$" | sort | uniq -c | sort -nr | head -5 | awk '{print $2 " - " $1 " requests"}'
echo ""

# Top 5 response status code

echo "Top 5 response status codes:"
awk '{if($9 != "-" && $9 ~ /^[0-9]+$/) print $9}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | awk '{print $2 " - " $1 " requests"}'
echo ""

# Top 5 user agents (excluding "-")

echo "Top 5 user agents:"
awk -F\" '{if($6 != "-") print $6}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | while read count agent
do
    echo "$agent - $count requests"
done
echo ""
