#!/usr/bin/env sh
echo "x86_64-efi"
mkdir buildslic/boot/grubfm/x86_64-efi
cd buildslic
find ./boot | cpio -o -H newc > ./memdisk.cpio
cd ..
modules=$(cat arch/x64-pxe/fmldr.lst)
#modules=acpi affs afs all_video at_keyboard bfs bitmap bitmap_scale blocklist boot bsd btrfs cat chain cmp commandline configfile cpio crc date datehook disk dm_nv echo efi_gop efi_mouse efi_uga efifwsetup eval exfat expr ext2 extcmd f2fs fat fatfs fb file fixmmap font fshelp gcry_arcfour gcry_blowfish gcry_camellia gcry_cast5 gcry_crc gcry_des gcry_dsa gcry_idea gcry_md4 gcry_md5 gcry_rfc2268 gcry_rijndael gcry_rmd160 gcry_rsa gcry_seed gcry_serpent gcry_sha1 gcry_sha256 gcry_sha512 gcry_tiger gcry_twofish gcry_whirlpool getargs getenv getkey gfxmenu gfxterm gfxterm_background gfxterm_menu gptsync gzio halt hashsum help hexdump hfs hfsplus http iso9660 jfs jpeg keylayouts keystatus legacycfg linux linuxefi loadbios loadenv loopback ls lsacpi lua lvm lzopio map mdraid09 mdraid09_be memdisk minicmd msdospart multiboot multiboot2 newc normal ntfs ntfscomp part_apple part_bsd part_gpt part_msdos parttool png probe progress raid5rec raid6rec random read reboot regexp reiserfs sbpolicy search setenv setkey sleep squash4 stat syslinuxcfg tar terminal terminfo test tga time tr true udf version video video_colors video_fb videoinfo xfs xnu xzio zfs
grub-mkimage -m ./buildslic/memdisk.cpio -d ./grub/x86_64-efi -p "(memdisk)/boot/grubfm" -c arch/x64-pxe/fmldr.cfg -o bootx64.efi -O x86_64-efi $modules
grub-mkimage -m ./buildslic/memdisk.cpio -d ./grub/x86_64-efi -p "(memdisk)/boot/grubfm" -c arch/x64-pxe/fmldr.cfg -o bootmgfw.efi -O x86_64-efi $modules
