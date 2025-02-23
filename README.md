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

The goal of this TP was to add a I2C device (ADXL345) and write a driver able to communicate with the device.

```bash
./qemu-system-arm -machine vexpress-a9 -nographic -kernel TP2/linux/build/arch/arm/boot/zImage -dtb TP2/linux/build/arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb -initrd rootfs.cpio.gz -fsdev local,path=TP2/pilote\_i2c,security\_model=mapped,id=mnt -device virtio-9p-device,fsdev=mnt,mount\_tag=mnt
```

Once on qemu, login with `root` and then run the follwing commands :

```bash
mount -t 9p -o trans=virtio mnt /mnt -oversion=9p2000.L,msize=10240
insmod /mnt/adxl345.ko 
```


## TP3 - Interface with the userspace

The goal of this TP was to create a user interface with the ADXL345.

```bash
./qemu-system-arm -machine vexpress-a9 -nographic -kernel TP3/linux-5.10.19/build/arch/arm/boot/zImage -dtb TP3/linux-5.10.19/build/arch/arm/boot/dts/vexpress-v2p-ca9.dtb -initrd rootfs.cpio.gz -fsdev local,path=TP3/pilote\_i2c,security\_model=mapped,id=mnt -device virtio-9p-device,fsdev=mnt,mount\_tag=mnt
```

Once on qemu, login with `root` and then run the follwing commands :

```bash
mount -t 9p -o trans=virtio mnt /mnt -oversion=9p2000.L,msize=10240
insmod /mnt/adxl345.ko 
cd /mnt
./main
```


## TP4 - Interruptions

The goal of this TP was interruptions and FIFOs in order to read the values of the ADXL345 and transmit them to the user.

```bash
./qemu-system-arm -machine vexpress-a9 -nographic -kernel TP4/linux/build/arch/arm/boot/zImage -dtb TP4/linux/build/arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb -initrd rootfs.cpio.gz -fsdev local,path=TP4/pilote\_i2c,security\_model=mapped,id=mnt -device virtio-9p-device,fsdev=mnt,mount\_tag=mnt
```

Once on qemu, login with `root` and then run the follwing commands :

```bash
mount -t 9p -o trans=virtio mnt /mnt -oversion=9p2000.L,msize=10240
insmod /mnt/adxl345.ko 
cd /mnt
chmod -R 755 .
./main
```


## TP5 - Concurrence

The goal of this TP was to fix the concurrent issues in pervious driver and user interface to make them safe to use.

```bash
./qemu-system-arm -machine vexpress-a9 -nographic -kernel TP5/linux/build/arch/arm/boot/zImage -dtb TP5/linux/build/arch/arm/boot/dts/arm/vexpress-v2p-ca9.dtb -initrd rootfs.cpio.gz -fsdev local,path=TP5/pilote\_i2c,security\_model=mapped,id=mnt -device virtio-9p-device,fsdev=mnt,mount\_tag=mnt
```

Once on qemu, login with `root` and then run the follwing commands :

```bash
mount -t 9p -o trans=virtio mnt /mnt -oversion=9p2000.L,msize=10240
insmod /mnt/adxl345.ko 
cd /mnt
./main
```
