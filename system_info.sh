#!/usr/bin/env bash

# show how long since the server was turned on
# load average -> shows how many processes are waiting in line to get CPU time
# -> show the average for 1 minute, 5 minutes and 15 minutes
# If a server has a high load average it means the system resources are not
# sufficient or misconfigured
uptime
uptime -p

# show the hour the server was turned on
uptime -s

# show how much space left in all partitions
df -h

# show how much space left in disk
df -h --type=ext4

# show RAM consumption
free -h
free -hw
