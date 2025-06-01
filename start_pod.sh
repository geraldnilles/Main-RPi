
#  Debugging
# podman run -it --userns=keep-id -v /home/gerald/Code/Main-RPi:/home/ubuntu/yocto --dns 8.8.8.8 yocto-builder:latest /bin/bash

#  Building
podman run -it --userns=keep-id -v /home/gerald/Code/Main-RPi:/home/ubuntu/yocto --dns 8.8.8.8 yocto-builder:latest /home/ubuntu/yocto/runall.sh "$1" "$2"
