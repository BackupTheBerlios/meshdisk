
LOCATION=http://meshdisk.berlios.de/src/
FILE=uClibc-toolchain-snapshot-20041207.tar.gz
DIR=toolchain

bin/toolchain_i386:  build/$(DIR)


build/$(DIR): sources/$(FILE)
	cd build && tar -xvzf ../sources/$(FILE)

sources/$(FILE): 
	cd sources && wget --passive-ftp $(LOCATION)$(FILE)
