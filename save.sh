#!/usr/bin/env bash

cd "$(dirname "$0")"

# Delete all WIC images to save space 
# TODO, figure out a better way to set this env file
rm poky/build/tmp/deploy/images/*/*.wic

# Save the git hash
git rev-parse HEAD > poky/build/tmp/deploy/images/githash

tar cJf geraldpi-artifacts.tar.xz poky/build/tmp/deploy/images 

aws s3 cp geraldpi-artifacts.tar.xz s3://gnbuildartifacts

