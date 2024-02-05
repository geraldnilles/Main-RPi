#!/usr/bin/env bash


# BUild all of the RPI4 Images
cd "$(dirname "$0")"
WIFI_SSID="$WIFI_SSID" WIFI_PASS="$WIFI_PASS" ./config.rpi4.sh

cd "$(dirname "$0")"
. poky/oe-init-build-env

bitbake geraldpi-documents
bitbake geraldpi-webapps
bitbake geraldpi-scam

