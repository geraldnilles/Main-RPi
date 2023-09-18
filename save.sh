#!/usr/bin/env bash

cd "$(dirname "$0")"

# Delete all WIC images to save space 
# TODO, figure out a better way to set this env file
rm poky/build/tmp/deploy/images/*/*.wic

# Save the git hash
git rev-parse HEAD > poky/build/tmp/deploy/images/githash

# Copy the conole log to the output image
cp -r poky/build/tmp/log poky/build/tmp/deploy/images/log

# Looks for any errors and copies those logfiles too
# TODO Copy ALL log failures, not just the latest
find poky/build/tmp/log -name console-latest.log | xargs -n 1 cat | grep "Logfile of failure" | awk 'BEGIN { FS=":"} { print $3}' | xargs -I{} -n 1 cp {} poky/build/tmp/deploy/images/log/

tar cJf geraldpi-artifacts.tar.xz poky/build/tmp/deploy/images 


