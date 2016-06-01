################################################################################
#
# rpi-bt-firmware
#
################################################################################

RPI_BT_FIRMWARE_VERSION = 1.0
RPI_BT_FIRMWARE_SITE = package/rpi-bt-firmware/fw
RPI_BT_FIRMWARE_SITE_METHOD = local
RPI_BT_FIRMWARE_INSTALL_TARGET = YES

define RPI_BT_FIRMWARE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0644 $(@D)/BCM43430A1.hcd $(TARGET_DIR)/lib/firmware/brcm/BCM43430A1.hcd
endef


$(eval $(generic-package))
