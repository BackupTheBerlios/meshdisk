
LOCATION=http://meshdisk.berlios.de/src/
FILE=uClibc-toolchain-snapshot-20041207.tar.gz
DIR=toolchain
TARGET=build/$(DIR)/gcc-3.3.x/toolchain_i386/bin/i386-linux-uclibc-gcc
UCLIBS="crt0.o \
crt1.o \
crti.o \
crtn.o \
ld-uClibc-0.9.26.so \
ld-uClibc.so.0 \
ldscripts \
libc.so \
libc.so.0 \
libcrypt-0.9.26.so \
libcrypt.so \
libcrypt.so.0 \
libdl-0.9.26.so \
libdl.so \
libdl.so.0 \
libm-0.9.26.so \
libm.so \
libm.so.0 \
libnsl-0.9.26.so \
libnsl.so \
libnsl.so.0 \
libpthread-0.9.26.so \
libpthread.so \
libpthread.so.0 \
libresolv-0.9.26.so \
libresolv.so \
libresolv.so.0 \
libthread_db-0.9.26.so \
libthread_db.so \
libthread_db.so.1 \
libuClibc-0.9.26.so \
libutil-0.9.26.so \
libutil.so \
libutil.so.0 \
"

bin.tmp/toolchain_i386:  root.tmp $(TARGET)
	cp -a build/$(DIR)/gcc-3.3.x/toolchain_i386/lib root.tmp/lib
	cp -r build/$(DIR)/gcc-3.3.x/toolchain_i386 bin.tmp
	
$(TARGET): build/$(DIR)
	make -C build/$(DIR)/gcc-3.3.x 

build/$(DIR): sources/$(FILE)
	cd build && tar -xvzf ../sources/$(FILE)

sources/$(FILE): 
	cd sources && wget --passive-ftp $(LOCATION)$(FILE)
