#!/usr/bin/env bash

cd "$(dirname "$0")"

# Delete the conf and genrate a new default one
cd poky
. oe-init-build-env

bitbake geraldpi-documents