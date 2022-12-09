#!/usr/bin/env bash


cd "$(dirname "$0")"
WIFI_SSID="$WIFI_SSID" WIFI_PASS="$WIFI_PASS" ./config.base.sh

sed -i  '/^LAYERSERIES_COMPAT_rust-layer/ s/=.*/= "dunfell gatesgarth hardknott honister kirkstone" /' meta-rust/conf/layer.conf

cd poky
. oe-init-build-env

bitbake-layers add-layer ../../meta-rust

cd conf

# Set the Machine to RaspberryPi4
sed -i '/^MACHINE/ s/=.*/= "raspberrypi0-wifi" /' local.conf


