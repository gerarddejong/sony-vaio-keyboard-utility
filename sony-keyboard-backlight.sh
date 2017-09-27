#!/bin/sh

if [ -d /sys/class/backlight/nv_backlight ]; then
    KEYS_DIR=/sys/class/backlight/nv_backlight
elif [ -d /sys/class/backlight/intel_backlight ]; then
    KEYS_DIR=/sys/class/backlight/intel_backlight
else
    exit 0
fi

MIN=0
MAX=$(cat $KEYS_DIR/max_brightness)
VAL=$(cat $KEYS_DIR/brightness)
STEP=1

if [ "$1" = down ]; then
	VAL=$((VAL-STEP))
fi

if [ "$1" = up ]; then
	VAL=$((VAL+STEP))
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
