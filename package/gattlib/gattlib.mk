#GATTLIB_VERSION = v0.2
GATTLIB_VERSION = dev
GATTLIB_SITE_METHOD = git
GATTLIB_SITE = https://github.com/labapart/gattlib.git
GATTLIB_LICENSE = LGPL
GATTLIB_LICENSE_FILES = LICENSE
GATTLIB_DEPENDENCIES += bluez_utils
GATTLIB_INSTALL_STAGING = YES
GATTLIB_MAKE=$(MAKE1)

$(eval $(cmake-package))
