#!/usr/bin/env bash

# Connect the provided IP address.  Use hte get_ip.sh script to get the running
# IP
eval "$(ssh-agent -s)"
ssh-add ~/.aws/key.pem

ssh -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" ubuntu@$1 "git clone https://github.com/geraldnilles/Main-RPi"

