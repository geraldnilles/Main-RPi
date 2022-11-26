#!/usr/bin/env bash

cd "$(dirname "$0")"

git submodule update --init --recursive

# Add Kirkstone into the meta-rust compat variable
# Meta-Rust is needed to properly build for ArmV6 Raspberry pis (Pi Zero and Zero W)
sed -i  '/^LAYERSERIES_COMPAT_rust-layer/ s/=.*/= "dunfell gatesgarth hardknott honister kirkstone" /' meta-rust/conf/layer.conf

# Delete the conf and genrate a new default one
rm poky/build/conf/local.conf

cd "$(dirname "$0")"
cd poky

. oe-init-build-env

# Add the meta layers
bitbake-layers add-layer ../../meta-raspberrypi
bitbake-layers add-layer ../../meta-openembedded/meta-oe
bitbake-layers add-layer ../../meta-openembedded/meta-python
bitbake-layers add-layer ../../meta-geraldpi
bitbake-layers add-layer ../../meta-rust

cd conf

# Set the Machine to RaspberryPi4
sed -i '/^MACHINE/ s/=.*/= "raspberrypi0-wifi" /' local.conf

# Set the distro
sed -i '/^DISTRO/ s/=.*/= "gpoky" /' local.conf

echo 'DEFAULT_TIMEZONE = "America/Los_Angeles"' >> local.conf
echo "WIFI_SSID = \"My Wifi Network\"" >> local.conf
echo "WIFI_PASSWORD = \"My password\"" >> local.conf 

# Set core count based on number of CPU cores
CPU_COUNT=$( grep -c ^processor /proc/cpuinfo )
echo "BB_NUMBER_THREADS = \"$(( $CPU_COUNT/2 ))\"" >> local.conf 
echo "PARALLEL_MAKE = \"-j $(( $CPU_COUNT/2))\"" >> local.conf 


