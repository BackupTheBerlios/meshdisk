
LOCATION_SL=http://www.kernel.org/pub/linux/utils/boot/syslinux/
FILE_SL=syslinux-2.11.tar.gz
DIR_SL=syslinux-2.11
TARGET_SL=build/$(DIR)/syslinux
# Things to install in /usr/bin
SL_INSTALL_BIN   = syslinux gethostip ppmtolss16 lss16toppm
# Things to install in /usr/lib/syslinux
SL_INSTALL_AUX   = pxelinux.0 isolinux.bin isolinux-debug.bin \
                syslinux.com syslinux.exe copybs.com memdisk/memdisk
# Things to install in /usr/lib
SL_INSTALL_LIB   = $(LIB_SO) libsyslinux.a


bin.tmp/syslinux:  $(TARGET_SL)
	mkdir -p bin.tmp/syslinux/bin
	mkdir -p bin.tmp/syslinux/lib
	mkdir -p bin.tmp/syslinux/lib/syslinux
	cd build/$(DIR_SL) && cp $(SL_INSTALL_BIN) ../../bin.tmp/syslinux/bin
	cd build/$(DIR_SL) && cp $(SL_INSTALL_AUX) ../../bin.tmp/syslinux/lib/syslinux
	cd build/$(DIR_SL) && cp $(SL_INSTALL_LIB) ../../bin.tmp/syslinux/lib
	
$(TARGET_SL): build/$(DIR_SL)
	make -C build/$(DIR_SL) installer

build/$(DIR_SL): sources/$(FILE_SL)
	cd build && tar -xvzf ../sources/$(FILE_SL)

sources/$(FILE_SL): 
	cd sources && wget --passive-ftp $(LOCATION_SL)$(FILE_SL)
