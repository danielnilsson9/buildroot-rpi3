#!/bin/sh

set -u
set -e

# Add a console on tty1
grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
sed -i '/GENERIC_SERIAL/a\
tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console' ${TARGET_DIR}/etc/inittab

#  Replace config.txt file with custom file in boot/config.txt
cp board/rpi3/boot/config.txt ${BINARIES_DIR}/rpi-firmware/config.txt

# Replace cmdline.txt file with custom file in boot/cmdline.txt
cp board/rpi3/boot/cmdline.txt ${BINARIES_DIR}/rpi-firmware/cmdline.txt


