#!/usr/bin/env bash

cd "$(dirname "$0")"

git submodule update --init --recursive

# Delete the conf and genrate a new default one
rm poky/build/conf/local.conf

cd poky

. oe-init-build-env

# Add the meta layers
bitbake-layers add-layer ../../meta-raspberrypi
bitbake-layers add-layer ../../meta-openembedded/meta-oe
bitbake-layers add-layer ../../meta-openembedded/meta-python
bitbake-layers add-layer ../../meta-geraldpi

cd conf

# Set the distro
sed -i '/^DISTRO/ s/=.*/= "gpoky" /' local.conf

echo 'DEFAULT_TIMEZONE = "America/Los_Angeles"' >> local.conf
echo "WIFI_SSID = \"$WIFI_SSID\"" >> local.conf
echo "WIFI_PASSWORD = \"$WIFI_PASS\"" >> local.conf 

# Set core count based on number of CPU cores
CPU_COUNT=$( grep -c ^processor /proc/cpuinfo )
echo "BB_NUMBER_THREADS = \"$(( $CPU_COUNT/2 ))\"" >> local.conf 
echo "PARALLEL_MAKE = \"-j $(( $CPU_COUNT/2))\"" >> local.conf 


