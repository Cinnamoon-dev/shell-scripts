#!/usr/bin/env bash

# This command shows the current percentage of the device's battery
echo $(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep -e percentage | cut -c 25-28 )
