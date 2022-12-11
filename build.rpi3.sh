#!/usr/bin/env bash


# Build all of the RPI3 Images
cd "$(dirname "$0")"
WIFI_SSID="$WIFI_SSID" WIFI_PASS="$WIFI_PASS" ./config.rpi3.sh

cd "$(dirname "$0")"
cd poky
. oe-init-build-env
bitbake geraldpi-thermostat

