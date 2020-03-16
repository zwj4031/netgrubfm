#!/usr/bin/env sh
if [ -e "netgrubfm.tar.gz" ]
then
    rm netgrubfm.tar.gz
fi
tar -zcvf grub.tar.gz tftpboot
cp grub.tar.gz ../../netgrubfm.tar.gz

if [ -e "netgrubfm.7z" ]
then
    rm netgrubfm.7z
fi
7z a ../netgrubfm.7z tftpboot
cp netgrubfm.7z ../../netgrubfm.7z


mkdir releases
    cp grubfm.iso releases/
    cp grubfm*.efi releases/
    cp loadfm releases/
    cd releases
    7z a ../grubfm-zh_CN.7z *
    cd ..
    rm -r releases
cp grubfm-zh_CN.7z ../../grubfm-zh_CN.7z
ls ../../

