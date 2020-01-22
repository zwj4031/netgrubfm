#source ${prefix}/func.sh;

default=1;
timeout=5;

if [ "$grub_platform" = "efi" ];
then
terminal_output console;
map --mem $grubfm_file;
   
elif [ "$grub_platform" = "pc" ];
then
export g4d_cmd="map --mem (rd)+1 (hd0);map (hd0) (hd1);map --hook;root (hd0,0);chainloader /bootmgr;boot";
export g4d_cmd_top="map --mem --top (rd)+1 (hd0);map (hd0) (hd1);map --hook;root (hd0,0);chainloader /bootmgr;boot";

menuentry $"启动Ramos (grub2读 map --mem) " --class net {
  terminal_output console;
   enable_progress_indicator=1;
   linux $prefix/grub.exe --config-file=$g4d_cmd;
   initrd ${grubfm_file};
}
menuentry $"启动Ramos (grub2读 map --mem --top) " --class net {
  terminal_output console;
   enable_progress_indicator=1;
   linux $prefix/grub.exe --config-file=$g4d_cmd_top;
   initrd ${grubfm_file};
}

menuentry $"启动Ramos (ipxe读 map --mem) " --class net {
  terminal_output console;
  enable_progress_indicator=1;
  linux16 $prefix/ipxe.lkrn dhcp \&\& kernel http://${net_default_server}/app/leagacy/grub.exe --config-file=$g4d_cmd \&\& initrd http://${net_default_server}$grubfm_path \&\& boot
  
}
menuentry $"启动Ramos (ipxe读 map --mem --top) " --class net {
  terminal_output console;
  enable_progress_indicator=1;
  linux16 $prefix/ipxe.lkrn dhcp \&\& kernel http://${net_default_server}/app/leagacy/grub.exe --config-file=$g4d_cmd_top \&\& initrd http://${net_default_server}$grubfm_path \&\& boot
  
}

  fi;
boot

