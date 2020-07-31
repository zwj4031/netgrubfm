
source ${prefix}/func.sh;

function auto_swap {
  if regexp '^hd[0-9a-zA-Z,]+$' ${grubfm_disk};
  then
    regexp -s devnum '^hd([0-9]+).*$' ${grubfm_disk};
    if test "devnum" != "0";
    then
      drivemap -s (hd0) (${grubfm_disk});
    fi;
  fi;
}
set lang=en_US;

terminal_output console;
loopback wimboot ${prefix}/wimboot.xz;
if [ "$grub_platform" = "efi" ];
then
   set enable_progress_indicator=1;
  echo                 ;
  echo                 ;
  echo                 ;
  echo                 ;
  echo                 ;
  echo                 ;
  echo                 ;
  echo                 ;
  echo                 ;
  echo                 ;
  echo                 ;
  echo                 ;
  echo                 ;
wimboot --rawwim --testmode=no \
        @:bootmgfw.efi:(wimboot)/bootmgfw.efi \
        @:boot.wim:"${grubfm_file}";

    boot;
	
elif [ "$grub_platform" = "pc" ];
then
  set enable_progress_indicator=1;
 wimboot --rawwim --testmode=no \
        @:bootmgfw.efi:(wimboot)/bootmgfw.efi \
        @:boot.wim:"${grubfm_file}";

fi;

