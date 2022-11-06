#!/usr/bin/env bash

cd "$(dirname "$0")"

# Delete the conf and genrate a new default one
cd poky/build/conf
mv local.conf local.back
cd ../../
. oe-init-build-env

cd conf

# Set the Machine to RaspberryPi4
sed -i '/^MACHINE/ s/=.*/= "raspberrypi4-64" /' local.conf
# Set the distro
sed -i '/^DISTRO/ s/=.*/= "gpoky" /' local.conf

echo 'DEFAULT_TIMEZONE = "America/Los_Angeles"' >> local.conf
echo "WIFI_SSID = \"My Wifi Network\"" >> local.conf
echo "WIFI_PASSWORD = \"My password\"" >> local.conf 

# Set core count based on number of CPU cores
CPU_COUNT=$( grep -c ^processor /proc/cpuinfo )
echo "BB_NUMBER_THREADS = \"$(( $CPU_COUNT/2 ))\"" >> local.conf 
echo "PARALLEL_MAKE = \"-j $(( $CPU_COUNT/2))\"" >> local.conf 

