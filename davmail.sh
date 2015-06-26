#!/usr/bin/env bash

CONFIG=${1:-/etc/davmail/davmail.properties}
if [[ -n $DAVMAIL_CONFIG_URL ]]; then
    wget -qO davmail.properties "$DAVMAIL_CONFIG_URL"
    CONFIG=$PWD/davmail.properties
fi

/usr/local/davmail/davmail.sh $CONFIG
