#!/bin/sh

echo "Copying control scripts..."
cp sony-keyboard-backlight.sh /etc/acpi
cp sony-keyboard-wifi.sh /etc/acpi

echo "Copying event handlers..."
cp events/sony-keyboard-backlight-down /etc/acpi/events 
cp events/sony-keyboard-backlight-up /etc/acpi/events 
cp events/sony-keyboard-s1 /etc/acpi/events 
cp events/sony-keyboard-s2 /etc/acpi/events

echo "Restarting ACPI deamon..."
service acpid restart

echo "Installation succeeded! Keys should now be enabled and working."
