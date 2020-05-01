
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
loopback wimboot ${prefix}/wimboot.gz;
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
  linuxefi $prefix/wimboot;
  initrdefi newc:bootmgfw.efi:(wimboot)/bootmgfw.efi \
            newc:bcd:(wimboot)/bcd \
            newc:boot.sdi:(wimboot)/boot.sdi \
            newc:boot.wim:"${grubfm_file}";

    auto_swap;
    set gfxmode=1920x1080,1366x768,1024x768,800x600,auto;
    terminal_output gfxterm;
    boot;
	
elif [ "$grub_platform" = "pc" ];
then
  set enable_progress_indicator=1;
  linux16 (wimboot)/wimboot;
  initrd16 newc:bootmgr:(wimboot)/bootmgr \
           newc:bootmgr.exe:(wimboot)/bootmgr.exe \
           newc:bcd:(wimboot)/bcd \
           newc:boot.sdi:(wimboot)/boot.sdi \
           newc:boot.wim:"${grubfm_file}";
fi;

