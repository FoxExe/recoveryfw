# RecoveryFW
Recovery initrd with web interface for WD MyCloud devices

### Dependencies
* Busybox (httpd support for now, sed and awk - in future.)
* Parted (For GPT disk manipultaion)


### Creating initrd for u-boot:

```sh
cd recoveryfw
find . | cpio -o -H newc | lzma -7 > ../initramfs.cpio.lzma
cd ..
mkimage -A arm -O linux -T ramdisk -C lzma -a 0x00e00000 -n Ramdisk -d initramfs.cpio.lzma uRamdisk
rm initramfs.cpio.lzma
```
