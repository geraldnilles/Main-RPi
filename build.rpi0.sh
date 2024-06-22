#!/usr/bin/env bash


# Build all of hte RPi0 Images
cd "$(dirname "$0")"
WIFI_SSID="$WIFI_SSID" WIFI_PASS="$WIFI_PASS" ./config.rpi0.sh

cd "$(dirname "$0")"
. poky/oe-init-build-env
bitbake geraldpi-cec
#bitbake geraldpi-speaker

