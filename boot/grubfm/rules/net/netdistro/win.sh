source ${prefix}/func.sh;
default=1;
timeout=5;


function setupiso {
        enable_progress_indicator=1;
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
        loopback wimboot ${prefix}/wimboot.xz;
		loopback -m tool ${prefix}/tool.gz;
		loopback netiso ${grubfm_file};
    	set setupwim=(netiso)/sources/boot.wim;
		save_env -f (tool)/null.cfg serverip;	
        save_env -f (tool)/null.cfg isopath;	
        save_env -f (tool)/null.cfg httptimeout;	
wimboot @:bootmgfw.efi:(wimboot)/bootmgfw.efi \
        @:winpeshl.ini:(tool)/winpeshl.ini \
        @:null.cfg:(tool)/null.cfg \
        @:startup.bat:(tool)/startup.bat \
        @:scx64.exe:(tool)/scx64.exe \
        @:scx86.exe:(tool)/scx86.exe \
        @:xfs_redir.sys:(tool)/xfs_redir.sys \
	    @:xfs_redir32.sys:(tool)/xfs_redir32.sys \
        @:xFsRedirx64.exe:(tool)/xFsRedirx64.exe \
        @:xFsRedirx86.exe:(tool)/xFsRedirx86.exe \
        @:boot.wim:${setupwim};
	
}

function setupmenu {
loopback loop $grubfm_file;
set win_prefix=(loop)/sources/install;
if [ -f (loop)/sources/boot.wim -a \
       -f ${win_prefix}.wim -o -f ${win_prefix}.esd -o -f ${win_prefix}.swm ];
  then
loopback -d loop;

menuentry $"安装微软原版iso (http即时加载) " --class nt6 {
        check; unset debug; clear;
		loopback -d loop;
		set lang=en_US; terminal_output console; set enable_progress_indicator=1; 
        export isopath="http://${net_default_server}$grubfm_path"; 
		export httptimeout=1;
		setupiso;
}

menuentry $"安装微软原版iso (http延时加载) " --class nt6 {
        check; unset debug; clear;
		loopback -d loop;
		set lang=en_US; terminal_output console; set enable_progress_indicator=1; 
        export isopath="http://${net_default_server}$grubfm_path"; 
		export httptimeout=6; 
        setupiso;
}


fi;
}

function check {
        echo wait.....;
		
}

if [ "$grub_platform" = "efi" ];
    then
	     setupmenu;

menuentry $"使用map加载到内存启动 " --class wim {
        terminal_output console;
        map --mem $grubfm_file;
}
      	

    elif [ "$grub_platform" = "pc" ];
then
        export g4d_cmd="map --mem (rd)+1 (0xff);map --hook;chainloader (0xff)";
		setupmenu;


menuentry $"使用memdisk方式启动" --class mem {
        terminal_output console;
        enable_progress_indicator=1;
        linux16 $prefix/memdisk iso raw;
        initrd16 "${grubfm_file}";
}

menuentry $"使用sanboot方式启动 (ipxe) " --class net {
        terminal_output console;
        linux16 $prefix/ipxe.lkrn dhcp \&\& sanboot --no-describe --keep http://${net_default_server}$grubfm_path \|\| chain http://${net_default_server}/$net_pxe_boot_file
}

menuentry $"使用g4d方式 (grub2读)" --class net {
        terminal_output console;
        enable_progress_indicator=1;
        linux $prefix/grub.exe --config-file=$g4d_cmd;
        initrd ${grubfm_file};
}

#menuentry $"使用g4d方式(ipxe读) " --class net {
#   terminal_output console;
#   enable_progress_indicator=1;
#   linux16 $prefix/ipxe.lkrn dhcp \&\& kernel http://${net_default_server}/app/legacy/grub.exe --config-file=$g4d_cmd \&\& initrd http://${net_default_server}$grubfm_path \&\& boot
  
#}


fi;
boot;
