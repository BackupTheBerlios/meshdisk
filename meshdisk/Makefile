
all: bzImage root.tar.gz initrd.gz 
include ./make/*.mk


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
root: root.tmp bin root.tmp/bin/busybox root.tmp/bin/iwconfig root.tmp/bin/olsrd root.tmp/bin/cardmgr root.tmp/bin/dropbear
	cd root.tmp/bin && strip
	cd root.tmp/lib && strip
	mv root.tmp root

root.tmp:
	mkdir -p root.tmp/bin
	mkdir -p root.tmp/etc
	mkdir -p root.tmp/root
	mkdir -p root.tmp/lib
	mkdir -p root.tmp/var
	mkdir -p root.tmp/mnt
	mkdir -p root.tmp/dev
	mkdir -p root.tmp/proc
	mkdir -p root.tmp/sbin
bin/: bin.tmp bin.tmp/toolchain_i386 bin.tmp/syslinux
	mv bin.tmp bin
bin.tmp: 
	mkdir bin.tmp
