#!/usr/bin/env bash

# Downloads the latest build artifacts

aws s3 cp s3://gnbuildartifacts/geraldpi-artifacts.tar.xz ~/Downloads/

cd ~/Downloads

mkdir -p gpi

rm -rf gpi/*

mv geraldpi-artifacts.tar.xz gpi/
cd gpi

tar xvf geraldpi-artifacts.tar.xz 

rm geraldpi-artifacts.tar.xz

