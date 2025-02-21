# B4_embedded_linux
Writing a kernel and hardware drivers for fun.
Each folder contain the resulted compiled binaries and source code written.

## Getting started

Copy the git and get into the folder :

```bash
git clone https://github.com/LeRatonLaveurSolitaire/B4_embedded_linux.git
cd ./B4_embedded_linux
```

## TP1 - Booting a Linux System

The goal of this TP was to compiled a linux kernel from source and run it with different initramfs.

To run the kernel with init.c, run the following command :

```bash
./qemu-system-arm -machine vexpress-a9 -nographic -kernel TP1/linux/build/arch/arm/boot/zImage -dtb TP1/linux/build/arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb -initrd TP1/initramfs_simple/test.cpio.gz
```

To run the kernel with busybox, run the following command :

```bash
./qemu-system-arm -machine vexpress-a9 -nographic -kernel TP1/linux/build/arch/arm/boot/zImage -dtb TP1/linux/build/arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb -initrd TP1/initramfs_busybox/initramfs.gz
```

To run the kernel with U-boot, run the following command :

```bash
./qemu-system-arm -machine vexpress-a9 -nographic -kernel TP1/u-boot-2025.01/u-boot -sd TP1/sdcard/sd
```

Once in U-boot, run the follwing commands :

```bash
fatload mmc 0:1 0x62000000 zImage
fatload mmc 0:1 0x63000000 vexpress-v2p-ca9.dtb
fatload mmc 0:1 0x63100000 uinitramfs
bootz 0x62000000 0x63100000 0x63000000
```

## TP2 - Device Model

```bash
./qemu-system-arm -machine vexpress-a9 -nographic -kernel TP2/linux/build/arch/arm/boot/zImage -dtb TP2/linux/build/arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb -initrd rootfs.cpio.gz -fsdev local,path=TP2/pilote\_i2c,security\_model=mapped,id=mnt -device virtio-9p-device,fsdev=mnt,mount\_tag=mnt
```

Once on qemu, login with `root` and then run the follwing commands :

```bash
mount -t 9p -o trans=virtio mnt /mnt -oversion=9p2000.L,msize=10240
insmod /mnt/adxl345.ko 
```


## TP3 - Interface with the userspace

```bash

```


## TP4 - Interruptions

```bash

```


## TP5 - Concurrence

```bash

```
