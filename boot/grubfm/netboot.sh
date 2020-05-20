# Grub2-FileManager
# Copyright (C) 2020  A1ive.
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
source (pxe)/app/config/grubfm;

if [ "$grub_platform" = "efi" ];
then 
set netbootxyz=netboot.xyz.efi
set chain=chainloader -b -t
set arch="efi"
elif [ "$grub_platform" = "pc" ];
then 
set netbootxyz=netboot.xyz.lkrn
set chain=linux16
set arch="legacy bios"
fi;
function plugin {
menuentry $"返回" --class go-previous {
configfile $prefix/netboot.sh;
}


menuentry $"在线安装linux         [已启用] " --class check {
set lang=en_US; terminal_output console;
echo wait...................;
$chain (http,boot.netboot.xyz)/ipxe/$netbootxyz
}
menuentry $"在线重装win系统       [未安装] " --class cancel {
set lang=en_US; terminal_output console;
echo 未开放
}
menuentry $"游戏中心              [未安装] " --class cancel {
set lang=en_US; terminal_output console;
echo 未开放
}
menuentry $"获取更多插件..." --class search {
set lang=en_US; terminal_output console;
echo 未开放
}
menuentry $"在线升级    " --class uefi {
set lang=en_US; terminal_output console;
echo 未开放
}
}
}

function checklist {
stat -z (pxe)/dir.txt;
if [ "$?" = "0" ]
then 
netboot; grubfm_set --boot 1; clear_menu; lua $prefix/netlist.lua;
else
netboot; grubfm_set --boot 1; clear_menu; html_list (http)/;
fi;
}

menuentry $"网络文件 [$arch]" --class netgrubfm {
 checklist;
}
menuentry $"插件中心" --class dir {
 clear_menu; plugin;
}

menuentry $"本地文件" --class hdd {
 netboot; grubfm_set --boot 0; clear_menu; grubfm;
}

menuentry $"($net_default_server) [切换]" --class hdd {
 echo 输入域名或IP:; read net_default_server; configfile $prefix/netboot.sh;
}


source ${prefix}/global.sh;
