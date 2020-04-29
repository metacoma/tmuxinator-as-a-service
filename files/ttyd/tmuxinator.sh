#!/bin/sh

export EDITOR=vim
T_NAME=$1

test -f ${T_CONF_DIR}/${T_NAME}.yml && {
	tmuxinator start ${T_NAME}
} || {
	tmuxinator new ${T_NAME} && tmuxinator start ${T_NAME}
} 
