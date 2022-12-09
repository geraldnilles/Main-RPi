#!/usr/bin/env bash


cd "$(dirname "$0")"
WIFI_SSID="$WIFI_SSID" WIFI_PASS="$WIFI_PASS" ./config.base.sh

cd poky
. oe-init-build-env


cd conf

# Set the Machine to RaspberryPi4
sed -i '/^MACHINE/ s/=.*/= "raspberrypi3-64" /' local.conf

