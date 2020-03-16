#!/usr/bin/env sh

if [ -e "netgrubfm-zh_CN.7z" ]
then
    rm netgrubfm-zh_CN.7z
fi
7z a netgrubfm-zh_CN.7z tftpboot
cp netgrubfm-zh_CN.7z ../../netgrubfm-zh_CN.7z



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

