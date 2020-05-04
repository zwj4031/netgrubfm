set lang=en_US;
terminal_output console;
set enable_progress_indicator=1;
mkinitrd -c a (http)/initrd.xz
mkinitrd -a a (http)/netcopy.run netcopy.run
#mkinitrd -a a (http)/linuxrc linuxrc
linux (http)/vmlinuz from=udm guiexec=sh~/mnt/live/netcopy.run
initrd (a)


#oopback loop (http)/porteus.iso
#mkinitrd -a a (loop)/porteus/base/000-kernel.xzm porteus/base/000-kernel.xzm
#mkinitrd -a a (loop)/porteus/base/001-core.xzm porteus/base/001.xzm 
#mkinitrd -a a (loop)/porteus/base/002-xorg.xzm porteus/base/002.xzm
#mkinitrd -a a (loop)/porteus/base/003-openbox.xzm porteus/base/003.xzm
#ls (a)/porteus/base
#inux (loop)/boot/syslinux/vmlinuz from=udm