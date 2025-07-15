#!/bin/bash
#Authour
#Data
#Desc
echo -e "OS Version:"
cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2
echo
echo -e "Uptime:"
uptime -p
echo
echo -e "Load average"
cat /proc/loadavg | awk ' {print $1,$2.$3}'
echo
echo Logged in users:
who
echo
echo Failed login attempts:
cat /var/log/auth.log | grep  'Failed password' | wc -l
echo
echo Total CPU usage:
cat /proc/loadavg | awk ' {print $1,$2.$3}'
echo
echo Total MEM usage:
echo
awk '/MemTotal/,/MemFree/ {print}' /proc/meminfo
echo
echo Total disk usage:
echo
df -h | awk '{print $2,$5,$4}' | column -t
echo
echo Top 5 processes by CPU usage:
echo
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6 | column -t
echo
echo Top 5 processes by memory usage:
echo
ps -eo pid,comm,%mem --sort=-%mem | head -n 6 | column -t
echo
