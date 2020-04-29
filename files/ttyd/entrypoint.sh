#!/bin/sh
set -ex

TTYD_PORT=7681

p=`curl -s ${API_ENDPOINT}/api/v1/port | jq '.p'` 
chisel client ${TUNNEL_ENDPOINT} R:0.0.0.0:${p}:127.0.0.1:${TTYD_PORT} &
ttyd -p${TTYD_PORT} /bin/sh
