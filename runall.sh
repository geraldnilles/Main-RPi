#!/usr/bin/env bash

cd "$(dirname "$0")"

./config.sh

./build.sh

./save.sh

echo "Build Finished.  Waiting 5m before shutting down instance"
sleep 300

sudo shutdown -h 0

