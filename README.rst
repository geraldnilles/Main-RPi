#############################
 Main GeraldPi Build Project
#############################

This is a collection of git submodules that shoudl make it easier to clone and
build this project from scratch

AWS Setup
=========

Create an EC2 instance.  

I recommend using a SPOT instance since it is much cheaper.  

Configure the EBS to be 100GB.  Also the EBS to not terminate when the instance
stops.  This will allow the build to resume if there is an error

Set the IAM role to give Full S3 access so you can upload the build to a bucket
when complete.


After the server is run, opena sehll on your local machine and run:

        eval "$(ssh-agent -s)"
        ssh-add ~/aws/MyAWSKey.pem

You can now ssh into the Ec2 with the public IP address, clone the repo, and
get going



Build 
=====

Clone this repo onto a ubuntu instance.

Edit the config.sh script to change the wifi credentials (if desired)

Run the ./setup.sh script to install build dependencies.  It is probably best to reboot the system after running this.

Next, you can run the runall.sh script to do the rest.  It is probalby best to
run this in a tmux session


TODOs
=====

- Setup a AWS-CLI scripts for provisioning Ec2
- Change the deploy script for armv8 vs armv6


Backup
======

Jump into the poky directory and source the build environment::

        cd poky
        . oe-init-build-env

Add the other layers to the poky config::

        bitbake-layers add-layer ../../meta-raspberrypi
        bitbake-layers add-layer ../../meta-openembedded/meta-oe
        bitbake-layers add-layer ../../meta-openembedded/meta-python
        bitbake-layers add-layer ../../meta-geraldpi

Modify the build/conf/local.conf file to make the following changes::

        
        MACHINE ??= "raspberrypi4-64"

        # Use the gpoky distro to pull in a lot of common conf chnages
        DISTRO ?= "gpoky"

        DEFAULT_TIMEZONE = "America/Los_Angeles"

        WIFI_SSID = "My Wifi Network"
	WIFI_PASSWORD = "My password"

        BB_NUMBER_THREADS = "4"
	PARALLEL_MAKE = "-j 8"

You can now build any of the images::

        bitbake geraldpi-documents


