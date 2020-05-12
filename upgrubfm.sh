cd ~/git/grub2-filemanager
git pull
git log
echo copying...
echo copy distro
sudo cp -r ~/git/grub2-filemanager/boot/grubfm/distro/* ~/git/netgrubfm/boot/grubfm/distro/
echo copy rules
sudo cp -r ~/git/grub2-filemanager/boot/grubfm/rules/* ~/git/netgrubfm/boot/grubfm/rules/
echo copy themes
sudo cp -r ~/git/grub2-filemanager/boot/grubfm/themes/* ~/git/netgrubfm/boot/grubfm/themes/
echo copy arch
sudo cp -r ~/git/grub2-filemanager/arch/* ~/git/netgrubfm/arch/
echo copy lang
sudo cp -r ~/git/grub2-filemanager/lang/* ~/git/netgrubfm/lang/
echo copy global settings search.sh
sudo cp ~/git/grub2-filemanager/boot/grubfm/global.sh  ~/git/netgrubfm/boot/grubfm/
sudo cp ~/git/grub2-filemanager/boot/grubfm/settings.sh  ~/git/netgrubfm/boot/grubfm/
sudo cp ~/git/grub2-filemanager/boot/grubfm/search.sh ~/git/netgrubfm/boot/grubfm/
sudo cp ~/git/grub2-filemanager/build.sh ~/git/netgrubfm/
echo done.