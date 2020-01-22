#source ${prefix}/func.sh;

default=1;
timeout=5;

if [ "$grub_platform" = "efi" ];
then
terminal_output console;
map --mem $grubfm_file;
   
elif [ "$grub_platform" = "pc" ];
then
export g4d_cmd="map --mem (rd)+1 (0xff);map --hook;chainloader (0xff)";
#export g4d_cmd_pxe="pxe detect;map --mem http://${net_default_server}$grubfm_path";
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

menuentry $"使用g4d方式(grub2读)" --class net {
   terminal_output console;
   enable_progress_indicator=1;
   linux $prefix/grub.exe --config-file=$g4d_cmd;
   initrd ${grubfm_file};
}

menuentry $"使用g4d方式(ipxe读) " --class net {
   terminal_output console;
   enable_progress_indicator=1;
   linux16 $prefix/ipxe.lkrn dhcp \&\& kernel http://${net_default_server}/app/leagacy/grub.exe --config-file=$g4d_cmd \&\& initrd http://${net_default_server}$grubfm_path \&\& boot
  
}
#menuentry $"使用g4d方式(ipxe转g4d测试) " --class net {
#   terminal_output console;
#   enable_progress_indicator=1;
#   linux $prefix/grub.exe --config-file=$g4d_cmd_pxe;
#  linux16 $prefix/ipxe.lkrn dhcp \&\& kernel tftp://${net_default_server}/app/leagacy/grub.exe keeppxe --config-file=$g4d_cmd_pxe \&\& boot
#}


  fi;
boot