
LINUX_LOCATION=ftp://ftp.kernel.org/pub/linux/kernel/v2.4/
LINUX_FILE=linux-2.4.28.tar.bz2
LINUX_DIR=linux-2.4.28
LINUX_TARGET=build/$(LINUX_DIR)/arch/i386/boot/bzImage

bzImage:  $(LINUX_TARGET)
	cp -r $(LINUX_TARGET) bzImage
	
$(LINUX_TARGET): build/$(LINUX_DIR)
	cp files/linux.config build/$(LINUX_DIR)/.config
	cd build/$(LINUX_DIR) && make oldconfig dep bzImage

build/$(LINUX_DIR): sources/$(LINUX_FILE)
	cd build && tar -xvjf ../sources/$(LINUX_FILE)

sources/$(LINUX_FILE): 
	cd sources && wget --passive-ftp $(LINUX_LOCATION)$(LINUX_FILE)
