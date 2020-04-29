#!/bin/sh


p=`curl -s ${MASTER_ENDPOINT}/api/v1/port | jq '.p'` 
chisel client ${MASTER_ENDPOINT} R:0.0.0.0:${p}:127.0.0.1:${TTYD_PORT} &
