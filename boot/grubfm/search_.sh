# Grub2-FileManager
# Copyright (C) 2017  A1ive.
#
# Grub2-FileManager is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Grub2-FileManager is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Grub2-FileManager.  If not, see <http://www.gnu.org/licenses/>.
source $prefix/global.sh;


function list {    
    echo "正在搜索\"$zhaowj\"中的$zhaotype文件，稍候... ..."
    for file in $zhaowj*.$zhaotype $zhaowj*/*.$zhaotype $zhaowj*/*/*.$zhaotype; do
    test -e $zhaowj;      
           if test $? = "1"; then     
    continue;
	       fi
           if ! test -f "$file"; then continue;
		   fi
    regexp -s filename "$zhaowj/(.*)" "$file"
           if [ -z "$havefile" ]; then set havefile="1"; fi	
    set path=""; export path;
    menuentry "$file" --class $icon {
    export file=${1}; grubfm_open $file;
    }
    done
           if [ -z "$havefile" ]; then
    echo
    echo "在\"$zhaowj\"没有找到$zhaotype文件!"
    echo
    echo -n "ESC "
    sleep -i -v 1
    else
    menuentry "继续搜索" --class go-previous {
    configfile $prefix/search.sh;
    }
	menuentry "返回" --class go-previous {
    grubfm;
    }
    unset havefile
           fi
    unset filename	
    }
    
function google {
    menuentry "返回 " --class go-previous {
    grubfm;
    }	
    menuentry "当前设备:$zhaowj [回车切换] 请选择文件类型进行搜索 " --class hdd {
	if [ "$zhaowj" = "${grubfm_current_path}" ];
	then 
	set zhaowj="(*)";
	elif [ "$zhaowj" = "(*)" ];
	then
	set zhaowj="(hd0,msdos1)";
	elif [ "$zhaowj" = "(hd0,msdos1)" ];
	then
	set zhaowj="(*)";
	fi
	configfile $prefix/search.sh;
	
    }	
submenu "wim" --class wim --hotkey=0{
 set zhaotype=wim; set icon=wim;
		list;

	}
	submenu "iso" --class iso --hotkey=0{
 set zhaotype=iso; set icon=iso;
		list;
	}
	submenu "img" --class img --hotkey=1{
 set zhaotype=img; set icon=img;
		list;
	}
	submenu "vhd" --class img --hotkey=0{
 set zhaotype=vhd; set icon=img;
		list;
	}
	submenu "efi" --class exe --hotkey=0{
 set zhaotype=efi; set icon=exe;
		list;
	}	
	submenu "ima" --class img --hotkey=0{
 set zhaotype=ima; set icon=img;
		list;
	}	

	submenu "ipxe" --class net --hotkey=1{
 set zhaotype=ipxe; set icon=net;
		list;
	}
	submenu "lst" --class cfg --hotkey=0{
 set zhaotype=lst; set icon=cfg;
		list;
	}
	
 submenu $"自定义搜索" --class settings {
echo $"请输入文件类型，比如'txt'";
read zhaotype;
set icon=$zhaotype;
list;	
}

}
google



