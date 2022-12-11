#!/usr/bin/env bash

aws ec2 run-instances --launch-template \
	"LaunchTemplateId=lt-0a1af00f1beebbca0,Version=1"

