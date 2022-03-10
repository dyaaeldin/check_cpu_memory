#!/bin/bash

while true
   do
        
	mem="$(free | grep Mem | awk '{print $3/$2 * 100.0}')"	
  cpu="$(uptime | awk {'print $8'} | cut -d "," -f1)"

	if (( $(echo "$mem > 75" |bc -l) )); then 			
             echo "list of the top consumption processes"
             ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 10
        
        fi

        if (( $(echo "$cpu > 2" |bc -l) )); then
	     echo "list of the top cpu  processes"
             ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 10
        fi	

	sleep 5

done
