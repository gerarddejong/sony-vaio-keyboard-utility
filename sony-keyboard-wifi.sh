#!/bin/sh

STATUS=$(nmcli radio wifi)

if [ "$1" = toggle ]; then
    if [ "$STATUS" = enabled ]; then
        nmcli radio wifi off
    else
        nmcli radio wifi on
    fi
fi
