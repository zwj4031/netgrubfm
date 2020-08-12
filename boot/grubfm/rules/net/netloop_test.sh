source ${prefix}/func.sh;
export enable_progress_indicator=1;

  loopback -d loop;
  loopback loop "${grubfm_file}";
  if [ -f (loop)/boot/grub/loopback.cfg ];
  then
    set grubfm_test=1;
  else
    set grubfm_test=0;
  fi;

  source ${prefix}/rules/net/netloop_detect.sh;
  loopback -d loop;
export enable_progress_indicator=0;