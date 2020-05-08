#!/usr/bin/env sh
echo -n "checking for gettext ... "
if [ -e "$(which msgfmt)" ]
then
    echo "ok"
else
    echo "not found\nPlease install gettext."
    exit
fi
echo -n "checking for mkisofs ... "
if [ -e "$(which mkisofs)" ]
then
    echo "ok"
    geniso=$(which mkisofs)
else
    echo -n "not found\nchecking for genisoimage ... "
    if [ -e "$(which genisoimage)" ]
    then
        echo "ok"
        geniso=$(which genisoimage)
    else
        echo "not found\nPlease install mkisofs or genisoimage."
        exit
    fi
fi
echo -n "checking for grub ... "
if [ -e "$(which grub-mkimage)" ]
then
    echo "ok"
else
    echo "not found\nPlease install grub."
    exit
fi

if [ -d "build" ]
then
    rm -r build
fi
mkdir build

echo "common files"
cp -r boot build/

echo "Language"
echo "1. Simplified Chinese"
echo "2. Traditional Chinese"
echo "3. English (United States)"
echo "4. Turkish"
echo "5. German"
echo "6. Vietnamese"
echo "7. Russian"
echo "8. Hebrew"
read -p "Please make a choice: " choice
case "$choice" in
    2)
        echo "zh_TW"
        cp grub/locale/zh_TW.mo build/boot/grubfm/locale/zh_TW.mo
        msgfmt lang/zh_TW/fm.po -o build/boot/grubfm/locale/fm/zh_TW.mo
        cp lang/zh_TW/lang.sh build/boot/grubfm/
        ;;
    3)
        echo "en_US"
        ;;
    4)
        echo "tr_TR"
        cp grub/locale/tr_TR.mo build/boot/grubfm/locale/tr_TR.mo
        msgfmt lang/tr_TR/fm.po -o build/boot/grubfm/locale/fm/tr_TR.mo
        cp lang/tr_TR/lang.sh build/boot/grubfm/
        ;;
    5)
        echo "de_DE"
        cp grub/locale/de_DE.mo build/boot/grubfm/locale/de_DE.mo
        msgfmt lang/de_DE/fm.po -o build/boot/grubfm/locale/fm/de_DE.mo
        cp lang/de_DE/lang.sh build/boot/grubfm/
        ;;
    6)
        echo "vi_VN"
        cp grub/locale/vi_VN.mo build/boot/grubfm/locale/vi_VN.mo
        msgfmt lang/vi_VN/fm.po -o build/boot/grubfm/locale/fm/vi_VN.mo
        cp lang/vi_VN/lang.sh build/boot/grubfm/
        ;;
    7)
        echo "ru_RU"
        cp grub/locale/ru_RU.mo build/boot/grubfm/locale/ru_RU.mo
        msgfmt lang/ru_RU/fm.po -o build/boot/grubfm/locale/fm/ru_RU.mo
        cp lang/ru_RU/lang.sh build/boot/grubfm/
        ;;
    8)
        echo "he_IL"
        #cp grub/locale/he_IL.mo build/boot/grubfm/locale/he_IL.mo
        msgfmt lang/he_IL/fm.po -o build/boot/grubfm/locale/fm/he_IL.mo
        cp lang/he_IL/lang.sh build/boot/grubfm/
        ;;
    *)
        echo "zh_CN"
        cp grub/locale/zh_CN.mo build/boot/grubfm/locale/zh_CN.mo
        msgfmt lang/zh_CN/fm.po -o build/boot/grubfm/locale/fm/zh_CN.mo
        cp lang/zh_CN/lang.sh build/boot/grubfm/
        ;;
esac

echo "x86_64-efi"
mkdir build/boot/grubfm/x86_64-efi
for modules in $(cat arch/x64/optional.lst)
do
    echo "copying ${modules}.mod"
    cp grub/x86_64-efi/${modules}.mod build/boot/grubfm/x86_64-efi/
done
cp arch/x64/*.efi build/boot/grubfm
cp arch/x64/*.gz build/boot/grubfm
#cp arch/x64-pxe/*.* build/boot/grubfm/
cp arch/x64-pxe/wimboot build/boot/grubfm/
cp arch/legacy-pxe/tool.gz build/boot/grubfm/
cd build
find ./boot | cpio -o -H newc > ./memdisk.cpio
cd ..
rm -r build/boot/grubfm/x86_64-efi
rm build/boot/grubfm/*.efi
rm build/boot/grubfm/*.gz
modules=$(cat arch/x64/builtin.lst)
grub-mkimage -m ./build/memdisk.cpio -d ./grub/x86_64-efi -p "(memdisk)/boot/grubfm" -c arch/x64/config.cfg -o grubfmx64.efi -O x86_64-efi $modules

echo "i386-efi"
mkdir build/boot/grubfm/i386-efi
for modules in $(cat arch/ia32/optional.lst)
do
    echo "copying ${modules}.mod"
    cp grub/i386-efi/${modules}.mod build/boot/grubfm/i386-efi/
done
cp arch/ia32/*.efi build/boot/grubfm
cp arch/ia32/*.gz build/boot/grubfm
cd build
find ./boot | cpio -o -H newc > ./memdisk.cpio
cd ..
rm -r build/boot/grubfm/i386-efi
rm build/boot/grubfm/*.efi
rm build/boot/grubfm/*.gz
modules=$(cat arch/ia32/builtin.lst)
grub-mkimage -m ./build/memdisk.cpio -d ./grub/i386-efi -p "(memdisk)/boot/grubfm" -c arch/ia32/config.cfg -o grubfmia32.efi -O i386-efi $modules
rm build/memdisk.cpio
echo "i386-pc"

builtin=$(cat arch/legacy/builtin.lst) 
mkdir build/boot/grubfm/i386-pc
#netboot start
rm -r ./tftpboot
mkdir -p ./tftpboot/app/legacy
mkdir -p ./tftpboot/app/netgrubfm
mkdir -p ./tftpboot/imgs
mkdir -p ./tftpboot/app/grub4dos
#netboot end
modlist="$(cat arch/legacy/insmod.lst) $(cat arch/legacy/optional.lst)"
for modules in $modlist
do
    echo "copying ${modules}.mod"
    cp grub/i386-pc/${modules}.mod build/boot/grubfm/i386-pc/
done
cp arch/legacy/insmod.lst build/boot/grubfm/
cp arch/legacy/grub.exe build/boot/grubfm/
cp arch/legacy/duet64.iso build/boot/grubfm/
cp arch/legacy/memdisk build/boot/grubfm/
cp arch/legacy/ipxe.lkrn build/boot/grubfm/
cp arch/legacy/*.gz build/boot/grubfm/
cp arch/legacy-pxe/tool.gz build/boot/grubfm/
cd build
find ./boot | cpio -o -H newc | gzip -9 > ./fm.loop
#netboot start
find ./boot | cpio -o -H newc | gzip -9 > ../tftpboot/app/netgrubfm/fmcore
#netboot end
cd ..
rm -r build/boot
grub-mkimage -d ./grub/i386-pc -p "(memdisk)/boot/grubfm" -c arch/legacy/config.cfg -o ./build/core.img -O i386-pc $builtin
cat grub/i386-pc/cdboot.img build/core.img > build/fmldr
rm build/core.img
cp arch/legacy/MAP build/
cp -r arch/legacy/ntboot/* build/
$geniso -R -hide-joliet boot.catalog -b fmldr -no-emul-boot -allow-lowercase -boot-load-size 4 -boot-info-table -o grubfm.iso build
#netboot start
#grub-mkimage -d ./grub/i386-pc -c ./arch/legacy-pxe/pxefm.cfg -o pxefm -O i386-pc-pxe -prefix="(pxe)" pxe tftp newc http net efiemu biosdisk boot cat chain configfile cpio echo extcmd fat font gzio halt help iso9660 linux linux16 loopback ls lua lzopio memdisk minicmd newc normal ntfs ntldr part_gpt part_msdos search sleep tar test udf xzio
grub-mkimage -d ./grub/i386-pc -c ./arch/legacy-pxe/pxefm.0.cfg -o pxefm.0 -O i386-pc-pxe -prefix="(pxe)" pxe tftp newc http net efiemu biosdisk boot cat chain configfile cpio echo extcmd fat font gzio halt help iso9660 linux linux16 loopback ls lua lzopio memdisk minicmd newc normal ntfs ntldr part_gpt part_msdos search sleep tar test udf xzio
grub-mkimage -d ./grub/i386-pc -c ./arch/legacy-pxe/httpfm.cfg -o httpfm -O i386-pc-pxe -prefix="(http)" pxe tftp newc http net efiemu biosdisk boot cat chain configfile cpio echo extcmd fat font gzio halt help iso9660 linux linux16 loopback ls lua lzopio memdisk minicmd newc normal ntfs ntldr part_gpt part_msdos search sleep tar test udf xzio
cp pxefm.0 ./tftpboot/app/netgrubfm/pxefm
mv pxefm.0 ./tftpboot/app/netgrubfm/netgrubfm.pcbios
mv grubfmx64.efi ./tftpboot/app/netgrubfm/netgrubfm.efi
mv httpfm ./tftpboot/app/netgrubfm/httpfm.0 
cp ./arch/legacy-pxe/netgrubfm.ipxe ./tftpboot/app/netgrubfm
cp ./arch/legacy-pxe/g4ddisk ./tftpboot/app/grub4dos
cp ./arch/legacy-pxe/*.bat ./tftpboot
cp ./arch/legacy/grub.exe ./tftpboot/app/legacy
cp ./arch/legacy-pxe/grldr ./tftpboot/app/legacy
#cp ./arch/legacy-pxe/grub.bat ./tftpboot/app/legacy
cp ./arch/legacy-pxe/grubfm ./tftpboot/app/config
#cp ./arch/x64-pxe/loadefi ./tftpboot/app/config
cp ./arch/legacy-pxe/ipxe.efi ./tftpboot/
cp ./arch/legacy-pxe/ipxe.bios ./tftpboot/

#cp ./arch/x64-pxe/loadfmx64.efi ./tftpboot/loadfmx64.efi.0

cp -r bin tftpboot/


#netboot end
rm -r build
cp -r ./tftpboot/* /mnt/s/netinstall-master
cp -r ./tftpboot/* /mnt/s/netgrubfm
rm -r tftpboot
