
varlist = 
{
		"name",
		"icon",
		"bootwin",
		"listiso",
		"listall",
		"bootfile",
		"cmd"
}

function getini(num)
    i=1
    i=i+1
    for i,myvar in ipairs(varlist) do
            getvar = (grub.ini_get (ini, num, myvar))
        if  getvar == nil then
            getvar = ""
        else
          --print(myvar .. "=" .. getvar)
		    grub.script ("unset " .. myvar .. "")
            grub.script ("export " .. myvar .. "=\"" .. getvar .. "\";")
	    end
		
    end
	--grub.ini_free(ini)
end

function getbootbootfile()
		 j = grub.getenv ("j")
		 getini(j)
end
	 
function previous()            
		--add go-previous menu--   
            icon = ("go-previous")
            name = grub.gettext ("返回➯[文件管理器]┇请选择要启动的文件[按'S'键设置]")
            command = "export theme_std=${prefix}/themes/slack/theme.txt; "
        .. "export theme_fm=${prefix}/themes/slack/fm.txt; "
        .. "export theme_help=${prefix}/themes/slack/help.txt; "
        .. "export theme_info=${prefix}/themes/slack/info.txt; grubfm"
            grub.add_icon_menu (icon, command, name)
		    
					
end            

function previousdiy()            
		--add go-previous menu--   
            icon = ("go-previous")
            name = grub.gettext ("返回➯[diy菜单]┇请选择要启动的文件[按'S'键设置]")
            command = "configfile (diy)/diy"
            grub.add_icon_menu (icon, command, name)
		
		
end       

function settings()            
	    	hotkey = ("s")
            name = grub.gettext ("设置")
            command = "clear_menu; set func=setenv; lua (diy)/diy.lua"
            grub.add_hidden_menu (hotkey, command, name)
					
		
end               

function setenv ()            
            previousdiy() 
			if initmode == "listiso" then
			command = "set initmode=listall; save_env -f (${cfg})/boot/grubfm/diy.cfg initmode; clear_menu; set func=setenv; lua (diy)/diy.lua;"
			name = grub.gettext ("下次启动[列出ISO]")
			
			elseif initmode == "listall" then
			command = "set initmode=diymenu; save_env -f (${cfg})/boot/grubfm/diy.cfg initmode; clear_menu; set func=setenv; lua (diy)/diy.lua;"
			name = grub.gettext ("下次启动[列出ISO/WIM/VHD]")
			
			elseif initmode == "diymenu" then
			command = "set initmode=listiso; save_env -f (${cfg})/boot/grubfm/diy.cfg initmode; clear_menu; set func=setenv; lua (diy)/diy.lua;"
			name = grub.gettext ("下次启动[DIY菜单]")
			end
			icon = ("settings")           
            grub.add_icon_menu (icon, command, name)
		--grubfm_set boot 1
			if grubfm_setboot == "1" then
			command = "set grubfm_setboot=0; save_env -f (${cfg})/boot/grubfm/diy.cfg grubfm_setboot; clear_menu; set func=setenv; lua (diy)/diy.lua;"
			name = grub.gettext ("静默启动:[是]")
			else
			command = "set grubfm_setboot=1; save_env -f (${cfg})/boot/grubfm/diy.cfg grubfm_setboot; clear_menu; set func=setenv; lua (diy)/diy.lua;"
			name = grub.gettext ("静默启动:[否]")
			end
			icon = ("settings")           
            grub.add_icon_menu (icon, command, name)
           
       
end

function bootmenu()
    for j=1,10 do
	    name= (grub.ini_get (ini, j, "name"))
	    icon= (grub.ini_get (ini, j, "icon"))
	    bootfile= (grub.ini_get (ini, j, "bootfile"))
		bootwin= (grub.ini_get (ini, j, "bootwin"))
		listiso= (grub.ini_get (ini, j, "listiso")) 
		listall= (grub.ini_get (ini, j, "listall")) 
		cmd= (grub.ini_get (ini, j, "cmd")) 
	
		if name == nil then
           name = (j) .. ".[空]"
		else 
           name = (j).. "." .. (name)
        end		
		if icon == nil then
           icon = "exe"
	    end
		if name ~= nil and bootfile ~=nil and cmd ==nil then
           command = "set func=boot; j=" .. j .. "; lua (diy)/diy.lua"   
           grub.add_icon_menu (icon,command, name)	   
		elseif bootwin ~= nil then
		   command = "set func=bootwin; j=" .. j .. "; lua (diy)/diy.lua"   
           grub.add_icon_menu (icon,command, name)
		elseif listiso ~= nil then
           command = "set func=listiso; j=" .. j .. "; lua (diy)/diy.lua"   
           grub.add_icon_menu (icon,command, name)
		elseif listall ~= nil then
           command = "set func=listall; j=" .. j .. "; lua (diy)/diy.lua"   
           grub.add_icon_menu (icon,command, name)   
		elseif cmd ~= nil then
           command = "set func=diycmd; j=" .. j .. "; lua (diy)/diy.lua"   
           grub.add_icon_menu (icon,command, name)
        
     
        end
	end	
end    
        --getenv
        func = grub.getenv ("func")
		platform = grub.getenv ("grub_platform")
		user = grub.getenv ("user")
                                diyini = grub.getenv ("diyini")
 		ini = grub.ini_load ("" .. diyini .. "")
	    initmode = grub.getenv ("initmode")
	    grubfm_setboot = grub.getenv ("grubfm_setboot")
		
        if func == nil then
        print("no command!!")
		
		elseif func == "bootmenu" then
	    grub.script ("clear_menu")
		previous()		
      	bootmenu()
		settings()
		
		elseif func == "listiso" then
	    getbootbootfile()
		grub.script ("source $prefix/search.sh; clear_menu")
		previousdiy()
        settings()
		grub.script ("echo 查找iso文件...; export srcdir=(*); search_list \"iso\" \"iso\";")
		
        elseif func == "listall" then
		getbootbootfile()
		grub.script ("source $prefix/search.sh; clear_menu")
		previousdiy()
        settings() 
	    grub.script ("echo 查找可启动文件...; export srcdir=(*); search_list \"iso\" \"iso\"; " 
		.. "search_list \"wim\" \"wim\"; search_list \"vhd\" \"img\";")
		 		 		
		elseif func == "bootwin" and platform == "pc" then
	    getbootbootfile()
	    grub.script ("echo 启动windows...; search --set=path -f -q /bootmgr; echo ($path)bootmgr; ntldr \"($path)/bootmgr\";")
		
		elseif func == "setenv" then
	    setenv()
		
	    elseif func == "bootwin" and platform == "efi" then
	    getbootbootfile()
	    grub.script ("echo 启动windows...; search --set=path -f -q /efi/boot/bootx64.efi; echo ($path)bootx64.efi; "
		.. "chainloader -b -t \"($path)/efi/boot/bootx64.efi\";")
		
	    elseif func == "boot" then
	    getbootbootfile()
	    grub.script ("echo 启动$bootfile...; search --set=path -f -q $bootfile; echo ($path)$bootfile; grubfm_open \"($path)$bootfile\";")
		
	    elseif func == "diycmd" then
	    getbootbootfile()
	    grub.script ("eval $cmd")
		end 

