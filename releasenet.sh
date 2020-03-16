#!/usr/bin/env sh
if [ -e "netgrubfm.tar.gz" ]
then
    rm netgrubfm.tar.gz
fi
tar -zcvf grub.tar.gz tftpboot
cp grub.tar.gz ../../netgrubfm.tar.gz

mkdir releases
    cp grubfm.iso releases/
    cp grubfm*.efi releases/
    cp loadfm releases/
    cd releases
    7z a ../grubfm-zh_CN.7z *
    cd ..
    rm -r releases
cp grubfm-zh_CN.7z ../../grubfm-zh_CN.7z
<<<<<<< HEAD
ls ../../
=======
ls ../../
>>>>>>> e4c0b14f9c6caddc43b89cc785fa50fc8d28fde0
