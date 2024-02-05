##########
 Notebook
##########

Tasks
=====

High Priority 
-------------

 * Add a web frontend to the gpi-thermostat

 * Pre-generate SSH Keys for gpi-documents to facilitate more secure copying

 * Add GrowISOfs to gpi-documents to allow for burning dvd backups. I will use
   multi-session writing to write multiple backups to teh same disk.  I will
   setup a timer that writes a backup every month.  I will use growisofs for
   this

Issues
------

The only appliance (so far) that needs the `vc4-kms-v3d` driver is the CEC
controller.  For whatever reason, the initram image kernel packs when this
dtoverlay is enabled.  As a workaround, the CEC device is using a regular boot
image (with NV memory enabled). Eventually, i should figure out why this panic
is occuring

