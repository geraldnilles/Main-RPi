#############################
 Main GeraldPi Build Project
#############################

This is a collection of git submodules that shoudl make it easier to clone and
build this project from scratch

Background
=========

Initially, I was using Google Cloud Build since they offered a lot of free
built time.  I set it up the docker containers and it was pretty good.  It
built the image and uploaded it to a google bucket for me to download later.

After upgrading the core count from 2 to 32, i relized the cost for Cloud Build
was pretty high.  6 cent per minute.  8 core machines were 1 cent per minute.
When doing a 2 hour build, that adds up.  Compariing these cost to a regular VM
instance, it is quite expsnvie.  a 16 core machine SPOT machine is 19 cents per hour.  


Image Setup
==========

Create a machine for setting up

Install the required tools:

        sudo apt install  build-essential chrpath diffstat lz4 wpasupplicant

Clone this repo into /home/username/Main-RPi

Copy the yoctobuilder.service to the /etc/systemd/system/ folder.  Modify it to
add the right wifi SSID and Password.  Enable it so it runs at boot.

Shutdown the VM.  Go to the Images tabe in the google consoler and convert the
VM Disk into an image.  This image will now pull the latest code from Git,
build and push to a GOogle bucket

Running
=======

Create a new VM, make sure you have at least 150G of disk space. Enable Ops
Agent so you can monitor logs during the build.  Also select your custom image
from above.  

You can also set it up so the VM deletes itself when it shuts down to minimize
cost. When debugging, you could disable this so you can poke around when a
built fails


