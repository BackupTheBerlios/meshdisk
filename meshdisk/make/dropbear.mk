
DB_LOCATION=http://matt.ucc.asn.au/dropbear/releases/
DB_FILE=dropbear-0.44.tar.gz
DB_DIR=dropbear-0.44
DB_TARGET=build/$(DB_DIR)/dropbearmulti

root.tmp/bin/dropbear:  $(DB_TARGET)
	cp build/$(DB_DIR)/dropbearmulti root.tmp/bin
	ln -s root.tmp/bin/dropbearmulti root.tmp/bin/dropbearkey
	ln -s root.tmp/bin/dropbearmulti root.tmp/bin/dropbear

	
$(DB_TARGET): build/$(DB_DIR)
	patch -p0 < files/dropbear_config.patch
	export PATH=$(PATH):$(PWD)/bin/toolchain_i386/bin && cd build/$(DB_DIR) && ./configure --disable-zlib --disable-openpty --host=i386-linux-uclibc
	cp files/dropbear_options.h build/$(DB_DIR)/options.h
	export PATH=$(PATH):$(PWD)/bin/toolchain_i386/bin && make -C build/$(DB_DIR)/ dropbearmulti

build/$(DB_DIR): sources/$(DB_FILE)
	cd build && tar -xvzf ../sources/$(DB_FILE)

sources/$(DB_FILE): 
	cd sources && wget --passive-ftp $(DB_LOCATION)$(DB_FILE)
