################################################################
# this file is important in remastering or creating arch based distro
# purpose is to copy all needed files, configs, and the like for customization
################################################################
. ./config.sh # config file

cd $aa

# this copies the main pacman command bash script and a list of packages to be installed
cp pacman.sh $LFS
cp $aa/files/pkglist.txt $LFS

# copy over some files
cp $aa/.bashrc $LFS/root/
cp $aa/files/mkinitcpio.conf $LFS/etc
cp $aa/files/mirrorlist $LFS/etc/pacman.d #use official mirrors
cp $aa/files/pacman.conf $LFS/etc
#cp -r $aa/files/.config $LFS/root

# copy old kernel and change name
cp $aa/iso/arch/boot/x86_64/vmlinuz $LFS/boot/vmlinuz-linux

# copy much needed internet file so network works in chroot
cp /etc/resolv.conf $LFS/etc/resolv.conf

# sed command to enable multilib suppport # comment out if unneeded
sed -i "/\[multilib\]/,/Include/"'s/^#//' $LFS/etc/pacman.conf #enable mutilib dor development

