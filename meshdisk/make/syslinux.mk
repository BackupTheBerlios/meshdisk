
LOCATION_SL=http://www.kernel.org/pub/linux/utils/boot/syslinux/
FILE_SL=syslinux-2.11.tar.gz
DIR_SL=syslinux-2.11
TARGET_SL=build/$(DIR)/syslinux

bin.tmp/syslinux:  $(TARGET_SL)
	
$(TARGET_SL): build/$(DIR_SL)
	make -C build/$(DIR_SL) installer

build/$(DIR_SL): sources/$(FILE_SL)
	cd build && tar -xvzf ../sources/$(FILE_SL)

sources/$(FILE_SL): 
	cd sources && wget --passive-ftp $(LOCATION_SL)$(FILE_SL)
