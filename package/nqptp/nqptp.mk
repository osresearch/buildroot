################################################################################
#
# nqptp
#
################################################################################

NQPTP_VERSION = 1.2.4
NQPTP_SITE = $(call github,mikebrady,nqptp,$(NQPTP_VERSION))

NQPTP_LICENSE = MIT, BSD-3-Clause
NQPTP_LICENSE_FILES = LICENSES
NQPTP_DEPENDENCIES = libconfig host-pkgconf

# git clone, no configure
NQPTP_AUTORECONF = YES

NQPTP_CONF_OPTS = 

#NQPTP_CONF_ENV += LIBS="$(NQPTP_CONF_LIBS)"

define NQPTP_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/nqptp \
		$(TARGET_DIR)/usr/bin/nqptp
endef

define NQPTP_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 0755 package/nqptp/S90nqptp \
		$(TARGET_DIR)/etc/init.d/S90nqptp
endef

$(eval $(autotools-package))
