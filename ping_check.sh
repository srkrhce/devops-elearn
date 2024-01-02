#!/bin/bash

# Define the subnet and range to check
subnet="10.81.252"

# Iterate over the range of IP addresses within the subnet
for a in `seq 1 255`
do
    ip="${subnet}.${a}"
   
    # Ping the IP address with a count of 1 and a timeout of 1 second
    ping -c 1 -W 1 "$ip" > /dev/null
    
    # Check the exit status of the ping command
    if [ $? -eq 0 ]; then
        echo "Ping to $ip succeeded"
    else
        echo "Ping to $ip failed"
    fi
done
