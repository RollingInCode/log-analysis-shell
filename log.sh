#!/bin/bash

# Path to the log file
LOG_FILE="/path/to/access.log"

# Check if the log file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "The log file $LOG_FILE does not exist."
    exit 1
fi

# Count the total number of requests
total_requests=$(wc -l < "$LOG_FILE")
echo "Total requests: $total_requests"

# Extract the IP addresses from the log file and count the unique ones
unique_ips=$(awk '{print $1}' "$LOG_FILE" | sort | uniq | wc -l)
echo "Unique IP addresses: $unique_ips"

# List the top 10 most frequent IP addresses
echo "Top 10 IP addresses:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -10

exit 0
