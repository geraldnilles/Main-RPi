
podman run -it --userns=keep-id -v /home/gerald/Code/Main-RPi:/home/ubuntu/yocto --dns 8.8.8.8 yocto-builder:latest /bin/bash

