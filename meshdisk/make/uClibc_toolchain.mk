
LOCATION=http://meshdisk.berlios.de/src/
FILE=uClibc-toolchain-snapshot-20041207.tar.gz
DIR=toolchain
TARGET=build/$(DIR)/gcc-3.3.x/toolchain_i386/bin/i386-linux-uclibc-gcc

bin.tmp/toolchain_i386:  $(TARGET)
	cp -r build/$(DIR)/gcc-3.3.x/toolchain_i386 bin.tmp
	
$(TARGET): build/$(DIR)
	make -C build/$(DIR)/gcc-3.3.x 

build/$(DIR): sources/$(FILE)
	cd build && tar -xvzf ../sources/$(FILE)

sources/$(FILE): 
	cd sources && wget --passive-ftp $(LOCATION)$(FILE)
