#!/bin/bash
#
REDISCLI="/usr/bin/redis-cli"
LOGFILE="/var/log/keepalived-redis-state.log"

echo "[backup]" >> $LOGFILE
date >> $LOGFILE
echo "Being slave ..." >> $LOGFILE 2>&1
#sleep 25
echo "Run SLAVEOF cmd ..." >> $LOGFILE
$REDISCLI SLAVEOF {{ grains['master_ip'] }} 6379 >> $LOGFILE 2>&1