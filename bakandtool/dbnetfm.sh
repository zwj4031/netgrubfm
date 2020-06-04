tar -zcvf netgrubfm-$(date +%Y%m%d-%H%M).tar.gz netgrubfm/ --exclude=netgrubfm/.git --exclude=netgrubfm/.github --exclude=netgrubfm/.vs ;
tar -zcvf buildnetinstall-$(date +%Y%m%d-%H%M).tar.gz buildnetinstall/ --exclude=buildnetinstall/.git --exclude=buildnetinstall/.github --exclude=buildnetinstall/.vs --exclude=netinstall/tftpboot/;
tar -zcvf netinstall-$(date +%Y%m%d-%H%M).tar.gz netinstall/ --exclude=netinstall/.git --exclude=netinstall/.github --exclude=netinstall/.vs --exclude=netinstall/tftpboot/;
tar -zcvf makeiso-$(date +%Y%m%d-%H%M).tar.gz makeiso/ --exclude=makeiso/.git --exclude=makeiso/.github --exclude=makeiso/linux/initrd.xz --exclude=makeiso/.vs --exclude=makeiso/porteus_multiarch.iso;
tar -zcvf vhdboot-$(date +%Y%m%d-%H%M).tar.gz vhdboot/ --exclude=vhdboot/.git --exclude=vhdboot/.github --exclude=vhdboot/.vs --exclude=vhdboot/tftpboot/;

#tar -zcvf --exclude='.git' --exclude='.gitignore' grub2-filemanager-$(date +%Y%m%d-%H%M).tar.gz grub2-filemanager/;
cp netgrubfm-$(date +%Y%m%d-%H)*.tar.gz /mnt/m/同步/顶点home/2020研究pe专用/grub2研究包/;
cp buildnetinstall-$(date +%Y%m%d-%H)*.tar.gz /mnt/m/同步/顶点home/2020研究pe专用/grub2研究包/;
cp netinstall-$(date +%Y%m%d-%H)*.tar.gz /mnt/m/同步/顶点home/2020研究pe专用/grub2研究包/;
cp makeiso-$(date +%Y%m%d-%H)*.tar.gz /mnt/m/同步/顶点home/2020研究pe专用/grub2研究包/;
cp vhdboot-$(date +%Y%m%d-%H)*.tar.gz /mnt/m/同步/顶点home/2020研究pe专用/grub2研究包/;