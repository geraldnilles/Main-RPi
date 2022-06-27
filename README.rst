#############################
 Main GeraldPi Build Project
#############################

This is a collection of git submodules that shoudl make it easier to clone and
build this project from scratch


Clone
=====

The following will download all of the git submodules::

        git submo... 

If you ever want to update all of the submodules in 1 swoop. you can also run
this command::

        git ...

Build 
=====

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

