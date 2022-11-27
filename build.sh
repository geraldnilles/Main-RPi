#!/usr/bin/env bash

cd "$(dirname "$0")"

# Delete the conf and genrate a new default one
cd poky
. oe-init-build-env

bitbake geraldpi-documents
bitbake geraldpi-webapps
bitbake geraldpi-scam
bitbake geraldpi-cec
bitbake geraldpi-thermostat

