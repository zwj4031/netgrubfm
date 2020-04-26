#!/usr/bin/env sh
cd tool
find .| cpio -o -H newc | gzip -9 > ../tool.gz