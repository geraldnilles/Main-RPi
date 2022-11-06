#############################
 Main GeraldPi Build Project
#############################

This is a collection of git submodules that shoudl make it easier to clone and
build this project from scratch



Build 
=====

Clone this repo onto a ubuntu instance.

Edit the config.sh script to change the wifi credentials (if desired)

Run the ./setup.sh script to install build dependencies.  It is probably best to reboot the system after running this.

Next, you can run the runall.sh script to do the rest


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

