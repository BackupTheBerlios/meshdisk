include ./make/*.mk

all: root.tar.gz initrd.gz 

initrd.gz: initrd
	gzip initrd

initrd: initrd.tmp mnt
	mkfs.ext2 initrd.tmp
	mount -o loop -t ext2 initrd.tmp mnt
	cd mnt && tar -xvzf ../root.tar.gz
	umount mnt
	mv initrd.tmp initrd
initrd.tmp:
	dd if=/dev/zero of=initrd.tmp bs=1024 count=4096
mnt: 
	mkdir mnt	

clean: 
	rm -f initrd.* root.tar.gz	

root.tar.gz: root
	cd root && tar -cvzf ../root.tar.gz .
root: root.tmp bin root.tmp/bin/busybox root.tmp/bin/iwconfig root.tmp/bin/olsrd root.tmp/bin/cardmgr
	mv root.tmp root

root.tmp:
	mkdir -P root.tmp/bin
	mkdir -P root.tmp/etc
	mkdir -P root.tmp/root
	mkdir -P root.tmp/lib
	mkdir -P root.tmp/var
	mkdir -P root.tmp/mnt
	mkdir -P root.tmp/dev
	mkdir -P root.tmp/proc
	mkdir -P root.tmp/sbin
bin: bin.tmp bin.tmp/toolchain_i386
	mv boot.tmp boot
bin: 
	mkdir bin
