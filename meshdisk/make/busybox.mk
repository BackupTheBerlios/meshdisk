
BB_LOCATION=http://busybox.net/downloads/
BB_FILE=busybox-1.00.tar.gz
BB_DIR=busybox-1.00
BB_TARGET=build/$(BB_DIR)/busybox

root.tmp/bin/busybox: $(BB_TARGET)
	make -C build/$(BB_DIR) install
	
$(BB_TARGET): build/$(BB_DIR)
	cp files/busybox.config build/$(BB_DIR)/.config
	make -C build/$(BB_DIR) oldconfig 
	export PATH=$(PATH):$(PWD)/bin/toolchain_i386/bin && \
	make -C build/$(BB_DIR)

build/$(BB_DIR): sources/$(BB_FILE)
	cd build && tar -xvzf ../sources/$(BB_FILE)

sources/$(BB_FILE): 
	cd sources && wget --passive-ftp $(BB_LOCATION)$(BB_FILE)
