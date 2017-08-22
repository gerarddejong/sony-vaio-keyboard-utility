#!/bin/sh
:
KEYS_DIR=/sys/class/backlight/nv_backlight

test -d $KEYS_DIR || exit 0

MIN=0
MAX=$(cat $KEYS_DIR/max_brightness)
VAL=$(cat $KEYS_DIR/brightness)

if [ "$1" = down ]; then
	VAL=$((VAL-1))
fi

if [ "$1" = up ]; then
	VAL=$((VAL+1))
fi

if [ "$1" = min ]; then
        VAL=1
fi

if [ "$1" = max ]; then
        VAL=$MAX
fi

if [ "$1" = toggle ]; then
        if [ "$VAL" = $MAX ]; then
        	VAL=1
	else
        	VAL=$MAX
	fi
fi

if [ "$VAL" -lt $MIN ]; then
	VAL=$MIN
elif [ "$VAL" -gt $MAX ]; then
	VAL=$MAX
fi

echo $VAL > $KEYS_DIR/brightness
