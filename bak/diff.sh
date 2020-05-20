cd ~/git/grub2-filemanager
git pull
git log
cd ~/git/netgrubfm
diff -rupN --exclude='.git' --exclude='.vs' --exclude='.github' ~/git/grub2-filemanager ~/git/netgrubfm > grubfm.patch
echo done.