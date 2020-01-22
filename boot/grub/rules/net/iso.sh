#source ${prefix}/func.sh;

default=1;
timeout=5;

if [ "$grub_platform" = "efi" ];
then
terminal_output console;
map --mem $grubfm_file;
   
elif [ "$grub_platform" = "pc" ];
then
menuentry $"使用memdisk方式启动" --class mem {
terminal_output console;
enable_progress_indicator=1;
linux16 $prefix/memdisk iso raw;
initrd16 "${grubfm_file}";
}

menuentry $"使用sanboot方式启动(ipxe) " --class net {
  terminal_output console;
   linux16 $prefix/ipxe.lkrn dhcp \&\& sanboot --no-describe --keep http://${net_default_server}$grubfm_path \|\| chain http://${net_default_server}/$net_pxe_boot_file
}


  fi;
boot