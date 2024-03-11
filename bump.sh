#!/usr/bin/env bash

cd "$(dirname "$0")"

cd meta-geraldpi

git pull origin kirkstone

cd ..


git add meta-geraldpi
git commit -m "Metalayer Bump"


