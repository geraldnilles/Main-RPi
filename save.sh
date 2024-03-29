#!/usr/bin/env bash

cd "$(dirname "$0")"

# Delete all WIC images to save space 
# TODO, figure out a better way to set this env file
rm build/tmp/deploy/images/*/*.wic

# Save the git hash
git rev-parse HEAD > build/tmp/deploy/images/githash

# Copy the conole log to the output image
cp -r build/tmp/log build/tmp/deploy/images/log

# Looks for any errors and copies those logfiles too
# TODO Copy ALL log failures, not just the latest
find build/tmp/log -name console-latest.log | xargs -n 1 cat | grep "Logfile of failure" | awk 'BEGIN { FS=":"} { print $3}' | xargs -I{} -n 1 cp {} build/tmp/deploy/images/log/

df -h

tar --zstd -cf geraldpi-artifacts.tar.zst build/tmp/deploy/images 

# Now that the deploy folder has been archieved, delete the entire tmp folder to save space
#rm -rf build/tmp

df -h

rm geraldpi-cache.tar*
# Zip all of the build cache for later use
cd build
tar --zst -cf ../geraldpi-cache.tar.zst sstate-cache downloads

df -h

