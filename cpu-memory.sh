#!/bin/bash

cpu_top_10() {
   echo "list of the top memory consumption"
   ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 10   
}

mem_top_10() {
   echo "list of the top cpu consumption"
   ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 10
}

todo() {
   echo "todo"
   
}

while true
   do        
	mem="$(free | grep Mem | awk '{print $3/$2 * 100.0}')"	
        cpu="$(uptime | awk {'print $8'} | cut -d "," -f1)"

	if (( $(echo "$mem > 75" |bc -l) || $(echo "$cpu > 3" |bc -l) )); then 			
           cpu_top_10 
	   mem_top_10
	   todo
        fi
	sleep 5

done
