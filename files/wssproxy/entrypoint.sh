#!/bin/sh

chisel server --port 4444 --reverse &
nginx -g 'daemon off;'
