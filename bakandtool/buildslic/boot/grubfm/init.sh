# Grub2-FileManager
# Copyright (C) 2016,2017,2018,2019,2020  A1ive.
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

set pager=0;
cat --set=modlist ${prefix}/insmod.lst;
for module in ${modlist};
do
    insmod ${module};
done;
search --set=windows -f -q /EFI/Microsoft/Boot/win7.efi;
acpi --slic $prefix/DELL.BIN;
chainloader -b ($windows)/EFI/Microsoft/Boot/win7.efi;
boot;


