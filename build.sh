#!/usr/bin/env bash


if [ -z $2 ]
then

	echo "ERROR: Please enter wifi SSID and password you want to embed into the built images"
	echo "> $0 MyWifiSSID myw1f1passw0rd"
	exit 1

fi

WIFI_SSID="$1" WIFI_PASS="$2" ./build.rpi4.sh
WIFI_SSID="$1" WIFI_PASS="$2" ./build.rpi3.sh
WIFI_SSID="$1" WIFI_PASS="$2" ./build.rpi0.sh

