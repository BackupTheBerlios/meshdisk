
CS_LOCATION=http://pcmcia-cs.sourceforge.net/ftp/
CS_FILE=pcmcia-cs-3.2.8.tar.gz
CS_DIR=pcmcia-cs-3.2.8
CS_TARGET=build/$(CS_DIR)/cardmgr

root.tmp/bin/cardmgr:  $(CS_TARGET)
	
$(CS_TARGET): build/$(CS_DIR)
	sed s,LINUXDIR,$(PWD)/build/linux-2.4.28, files/pcmcia-cs.config > build/$(CS_DIR)/config.in
	export PATH=$(PATH):$(PWD)/bin/toolchain_i386/bin &&  make -C build/$(CS_DIR) oldconfig all

build/$(CS_DIR): sources/$(CS_FILE)
	cd build && tar -xvzf ../sources/$(CS_FILE)

sources/$(CS_FILE): 
	cd sources && wget --passive-ftp $(CS_LOCATION)$(CS_FILE)
