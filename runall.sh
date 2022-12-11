#!/usr/bin/env bash

cd "$(dirname "$0")"

if [ -z $2 ]
then

	echo "ERROR: Please enter wifi SSID and password you want to embed into the built images"
	echo "> $0 MyWifiSSID myw1f1passw0rd"
	exit 1

fi

./build.sh "$1" "$2"

./save.sh

echo "Build Finished.  Waiting 5m before shutting down instance"
sleep 300

sudo shutdown -h 0

