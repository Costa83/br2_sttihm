################################################################################
#
# stt-ihm
#
################################################################################

#STT_IHM_VERSION = feature-design
STT_IHM_VERSION = HEAD
STT_IHM_SITE = git@git.projects.openwide.fr:open-source/stt-ihm-passerelle.git
STT_IHM_SITE_METHOD = git
STT_IHM_LICENSE = MIT
ifeq ($(BR2_PACKAGE_STT_IHM_DB),y)
STT_IHM_DEPENDENCIES += mongoc
else
BR2_PACKAGE_STT_IHM_DB=n
endif

STT_IHM_OVERRIDE_SRCDIR=/home/mch/Projects/STT/stt-ihm-passerelle

#STT_IHM_MAKE_OPTS+=DEBUG=y
STT_IHM_MAKE_OPTS+=sysroot=$(STAGING_DIR)
STT_IHM_MAKE_OPTS+=DBM=$(BR2_PACKAGE_STT_IHM_DB)

define STT_IHM_CONFIGURE_CMDS
	cp $(STT_IHM_PKGDIR)/defconfig $(@D)
endef

define STT_IHM_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) \
		$(MAKE1) -C $(@D) $(STT_IHM_MAKE_OPTS)
endef

define STT_IHM_INSTALL_TARGET_CMDS
	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) \
		$(MAKE1) -C $(@D) $(STT_IHM_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
endef

define STT_IHM_INSTALL_STAGING_CMDS
endef

define STT_IHM_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 755 $(STT_IHM_PKGDIR)/S50stt-ihm \
		$(TARGET_DIR)/etc/init.d/S50stt-ihm
endef

define STT_IHM_INSTALL_INIT_SYSTEMD
	$(INSTALL) -D -m 644 $(STT_IHM_PKGDIR)/stt-ihm.service \
		$(TARGET_DIR)/usr/lib/systemd/system/stt-ihm.service
	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
	ln -fs ../../../../usr/lib/systemd/system/stt-ihm.service \
		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/stt-ihm.service
endef

$(eval $(generic-package))

