
WT_LOCATION=http://pcmcia-cs.sourceforge.net/ftp/contrib/
WT_FILE=wireless_tools.27.tar.gz
WT_DIR=wireless_tools.27
WT_TARGET=build/$(WT_DIR)/iwconfig

root.tmp/bin/iwconfig:  $(WT_TARGET)
	cp build/$(WT_DIR)/libiw.so.27 root.tmp/lib/
	cp build/$(WT_DIR)/iwconfig root.tmp/bin
	
$(WT_TARGET): build/$(WT_DIR)
	make -C build/$(WT_DIR)

build/$(WT_DIR): sources/$(WT_FILE)
	cd build && tar -xvzf ../sources/$(WT_FILE)

sources/$(WT_FILE): 
	cd sources && wget --passive-ftp $(WT_LOCATION)$(WT_FILE)
