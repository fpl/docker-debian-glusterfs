# docker-debian-glusterfs

_Docker image for GlusterFS based on Debian 10 and later_

This is an image based on official Debian stable-slim image, so it has very basic functionalities (e.g. it does not include systemd). 
The glusterfs package is a backport of the 9.0 official package, as it will be distributed in Debian 11 (bullseye). 
This image is not thought for upgrading any previous version and volume, which is in general a non straightful process.

Think about it as a basic image which can be extended when requred to include any upgrade paths (additional hooks and pre-run scripts).
Eventually it also can install the glusterfs.org deb packages.

## Update

Latest image is based on Debian Bookworm 12 with stock GlusterFS 10.3, and includes some basic networking tools for debugging.
