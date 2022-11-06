#!/usr/bin/env bash

cd "$(dirname "$0")"

tar cJf geraldpi-artifacts.tar.xz poky/build/tmp/deploy/images 

awscli s3 cp geraldpi-artifacts.tar.xz s3://gnyoctobuilds/

