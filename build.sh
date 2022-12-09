#!/usr/bin/env bash


if [ -z $2 ]
then

	echo "ERROR: Please enter wifi SSID and password you want to embed into the built images"
	echo "> $0 MyWifiSSID myw1f1passw0rd"
	exit 1

fi

# BUild all of the RPI4 Images
cd "$(dirname "$0")"
WIFI_SSID="$1" WIFI_PASS="$2" ./config.rpi4.sh
cd poky
. oe-init-build-env

bitbake geraldpi-documents
bitbake geraldpi-webapps
bitbake geraldpi-scam

# Build all of the RPI3 Images
cd "$(dirname "$0")"
WIFI_SSID="$1" WIFI_PASS="$2" ./config.rpi3.sh
cd poky
. oe-init-build-env
bitbake geraldpi-thermostat

# Build all of hte RPi0 Images
cd "$(dirname "$0")"
WIFI_SSID="$1" WIFI_PASS="$2" ./config.rpi0.sh
cd poky
. oe-init-build-env
bitbake geraldpi-cec

