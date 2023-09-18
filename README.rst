#############################
 Main GeraldPi Build Project
#############################

This is a collection of git submodules that shoudl make it easier to clone and
build this project from scratch

AWS Setup
=========

The scripts in the ./aws are used to build this project using an Amazon Web
Services EC2 isntance.

I recommend using a SPOT instance since it is much cheaper.  

Configure the EBS to be 150GB.  Also the EBS to not terminate when the instance
stops.  This will allow the build to resume if there is an error

Set the IAM role to give Full S3 access so you can upload the build to a bucket
when complete.

The following sequence is what i use:

Run the ./start.sh script to spawn a new instance.  Wait 10 or 15 seconds for it to complete.

Run the `./get_ip.sh` script to get the IP address of the new instance.

Run the `./clone.sh [IP Addr]` to ssh to the instance and clone the current repository

Run the `./connect.sh [IP Addr]` to start an interactive ssh shell

Once you are connected, cd into the Repo folder and run the `./setup.sh` script
to install all of the requried packages.


Build 
=====

Once the Instance is setup, start a tmux session::

        tmux new

To build everything, run the following command and provide the wifi credentials::

        runall.sh [WifiSSID] [WifiPassword]

This will build every image for each machine time, compress everything into a
tar.xz file, upload it to an amazon S3 bucket, and shutdown the EC2 instance

If you only want to build for one of the machine types, edit the `build.sh` script and delete the ./build.rpi*.sh scripts you want to skip.

If you only want to build a subset of the iamges, edit the specific `build.rpi*.sh` file and delete the bitbake line you want to skip


