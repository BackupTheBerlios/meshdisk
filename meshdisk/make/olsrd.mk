
OLSR_LOCATION=http://meshdisk.berlios.de/src/
OLSR_FILE=olsrd-0.4.8.tar.gz
OLSR_DIR=olsrd-0.4.8
OLSR_TARGET=build/$(OLSR_DIR)/olsrd

root.tmp/bin/olsrd:  $(OLSR_TARGET)
	cp files/olsrd.conf root.tmp/etc/olsrd.conf
	cp build/$(OLSR_DIR)/olsrd root.tmp/bin
	
$(OLSR_TARGET): build/$(OLSR_DIR)
	export PATH=$(PATH):$(PWD)/bin/toolchain_i386/bin && make -C build/$(OLSR_DIR) OS=linux CC=i386-linux-gcc

build/$(OLSR_DIR): sources/$(OLSR_FILE)
	cd build && tar -xvzf ../sources/$(OLSR_FILE)

sources/$(OLSR_FILE): 
	cd sources && wget --passive-ftp $(OLSR_LOCATION)$(OLSR_FILE)
