
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
LDD_VERSION = 'a330efe1f47335bfc6f60bae25bd224b11608267'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = 'git@github.com:cu-ecen-aeld/assignment-7-trieu1162000.git'
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

LDD_MODULE_SUBDIRS = scull misc-modules

$(eval $(kernel-module))

define LDD_DO_STUFF_WITH_KERNEL_MODULE
	$(MAKE) -C $(LINUX_DIR) M=$(@D)/misc-modules INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
	$(MAKE) -C $(LINUX_DIR) M=$(@D)/scull INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/sbin/
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/sbin/
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/sbin/
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/sbin/
endef

$(eval $(generic-package))
