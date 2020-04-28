
        --getenv
        func = grub.getenv ("func")
		platform = grub.getenv ("grub_platform")
     	autounattend = grub.getenv ("autounattend")
		    if func == nil then
        print("no command!!")
		
	    --wimboot
	    elseif func == "wimboot" and platform == "efi" then
		grub.script ("set lang=en_US; terminal_output console; set enable_progress_indicator=1; loopback wimboot ${prefix}/wimboot.gz; " ..
		"wimboot @:bootmgfw.efi:(wimboot)/bootmgfw.efi @:bcd:(wimboot)/bcd @:boot.sdi:(wimboot)/boot.sdi @:boot.wim:(http)$setupwim")
		
		elseif func == "wimboot" and platform == "pc" then
		grub.script ("set lang=en_US; terminal_output console; set enable_progress_indicator=1; loopback wimboot ${prefix}/wimboot.gz; " .. 
			"linux16 (wimboot)/wimboot; initrd16 newc:bootmgr:(wimboot)/bootmgr newc:bootmgr.exe:(wimboot)/bootmgr.exe newc:bcd:(wimboot)/bcd " ..
			"newc:boot.sdi:(wimboot)/boot.sdi newc:boot.wim:(http)$setupwim")
			
		--install windows iso	
		elseif func == "netsetup" and platform == "pc" and autounattend == nil then
		grub.script ("echo wait.......; " ..
		    "loopback wimboot ${prefix}/wimboot.gz; " ..
			"loopback -m tool ${prefix}/tool.gz; " ..
			"loopback netiso ${grubfm_file}; " ..
			"save_env -f (tool)/null.cfg serverip; " ..	
            "save_env -f (tool)/null.cfg isopath; " ..				
			"export setupwim=(netiso)/sources/boot.wim; " ..
			"set lang=en_US; terminal_output console; set enable_progress_indicator=1; linux16 (wimboot)/wimboot; " ..
            "initrd16 newc:bootmgr:(wimboot)/bootmgr " ..
			"newc:bootmgr.exe:(wimboot)/bootmgr.exe " ..
			"newc:BCD:(wimboot)/bcd " ..
			"newc:boot.sdi:(wimboot)/boot.sdi " ..
			"newc:winpeshl.ini:(tool)/winpeshl.ini " ..
			"newc:null.cfg:(tool)/null.cfg " ..
			"newc:startup.bat:(tool)/startup.bat " ..
			"newc:scx64.exe:(tool)/scx64.exe " ..
			"newc:scx86.exe:(tool)/scx86.exe " ..
			"newc:xfs_redir.sys:(tool)/xfs_redir32.sys " ..
			"newc:xFsRedirx64.exe:(tool)/xFsRedirx64.exe " ..
			"newc:xFsRedirx86.exe:(tool)/xFsRedirx86.exe " ..
			"newc:boot.wim:${setupwim};")
			
		elseif func == "netsetup" and platform == "pc" and autounattend ~= nil then
		grub.script ("echo wait.......; " ..
		    "loopback wimboot ${prefix}/wimboot.gz; " ..
			"loopback -m tool ${prefix}/tool.gz; " ..
			"loopback netiso ${grubfm_file}; " ..
			"save_env -f (tool)/null.cfg serverip; " ..	
		    "save_env -f (tool)/null.cfg isopath; " ..				
			"export setupwim=(netiso)/sources/boot.wim; " ..
			"set lang=en_US; terminal_output console; set enable_progress_indicator=1; linux16 (wimboot)/wimboot; " ..
            "initrd16 newc:bootmgr:(wimboot)/bootmgr " ..
			"newc:bootmgr.exe:(wimboot)/bootmgr.exe " ..
			"newc:BCD:(wimboot)/bcd " ..
			"newc:boot.sdi:(wimboot)/boot.sdi " ..
			"newc:winpeshl.ini:(tool)/winpeshl.ini " ..
			"newc:null.cfg:(tool)/null.cfg " ..
			"newc:startup.bat:(tool)/startup.bat " ..
			"newc:scx64.exe:(tool)/scx64.exe " ..
			"newc:scx86.exe:(tool)/scx86.exe " ..
			"newc:xfs_redir.sys:(tool)/xfs_redir32.sys " ..
			"newc:xFsRedirx64.exe:(tool)/xFsRedirx64.exe " ..
			"newc:xFsRedirx86.exe:(tool)/xFsRedirx86.exe " ..
			"newc:autounattend.xml:$autounattend " ..
			"newc:boot.wim:${setupwim};")
				
			
		--map iso
		elseif func == "mapiso" and platform == "efi" then
		print ("wait……")
		grub.script ("set lang=en_US; set enable_progress_indicator=1; echo loading iso....; map --mem (http)$grubfm_file")
		
		elseif func == "mapiso" and platform == "pc" then
		grub.script ("export grubfm_path=$grubfm_file; grubfm_file=$grubfm_file; configfile $prefix/rules/net/iso.sh;")
			
		end

