#!/usr/bin/env bash

cd "$(dirname "$0")"

git checkout .
git pull

git submodule update --init --recursive

# Delete the conf and genrate a new default one
rm build/conf/local.conf

. poky/oe-init-build-env

echo "Extracting Cache"

if [ -d downloads ]
then
	echo "Cache already present"
else
	echo "Extracting..."
	tar xf ../geraldpi-cache.tar.zst 
fi

# Add the meta layers
bitbake-layers add-layer ../meta-raspberrypi
bitbake-layers add-layer ../meta-openembedded/meta-oe
bitbake-layers add-layer ../meta-openembedded/meta-python
bitbake-layers add-layer ../meta-openembedded/meta-multimedia
bitbake-layers add-layer ../meta-geraldpi

cd conf

# Set the distro
sed -i '/^DISTRO/ s/=.*/= "gpoky" /' local.conf

echo 'DEFAULT_TIMEZONE = "America/Los_Angeles"' >> local.conf
echo "WIFI_SSID = \"$WIFI_SSID\"" >> local.conf
echo "WIFI_PASSWORD = \"$WIFI_PASS\"" >> local.conf 

# Set core count based on number of CPU cores
CPU_COUNT=$( grep -c ^processor /proc/cpuinfo )
HALF_CPU_COUNT=$((CPU_COUNT / 2))

# Ensure a minimum of 2
if [ $HALF_CPU_COUNT -lt 2 ]; then
  HALF_CPU_COUNT=2
fi

#echo "BB_NUMBER_THREADS = \"2\"" >> local.conf 
#echo "PARALLEL_MAKE = \"-j $HALF_CPU_COUNT\"" >> local.conf 

