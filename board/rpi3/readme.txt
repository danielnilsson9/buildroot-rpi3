Raspberry Pi 3

Intro
=====

Minimal Raspberry Pi 3 image based on the standard
board package for Raspberry Pi. Drivers for the 
built in WIFI and Bluetooth chips has been added
as packages and are enabled by default. A slimmed
defconfig file for the kernel is located in:

   board/rpi3/kernel/rpi3_minimal_defconfig



How to build it
===============

Configure Buildroot
-------------------

A defconfig file for Raspberry Pi 3 has been created which
you should base your work on. Load it by executing:

   $ make rpi3_defconfig


Build the rootfs
----------------

Note: you will need to have access to the network, since Buildroot will
download the packages' sources.

You may now build your rootfs with:

  $ make

(This may take a while, consider getting yourself a coffee ;-) )

Result of the build
-------------------

After building, you should obtain this tree:

    output/images/
    +-- bcm2710-rpi-3-b.dtb
    +-- boot.vfat
    +-- kernel-marked/zImage        [1]
    +-- rootfs.ext4
    +-- rpi-firmware/
    |   +-- bootcode.bin
    |   +-- cmdline.txt
    |   +-- config.txt
    |   +-- fixup.dat
    |   `-- start.elf
    +-- sdcard.img
    `-- zImage

[1] This is the mkknlimg DT-marked kernel.

How to write the SD card
========================

Once the build process is finished you will have an image called "sdcard.img"
in the output/images/ directory.

Copy the bootable "sdcard.img" onto an SD card with "dd":

  $ sudo dd if=output/images/sdcard.img of=/dev/sdX

Insert the SDcard into your Raspberry Pi, and power it up.
