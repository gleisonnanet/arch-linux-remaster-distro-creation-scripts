################################################################
# this is the generate iso script, it has ost important stuff here for iso creation
################################################################
. ./config.sh # config

# copy pkglist.txt & remove the pacman scritp
cd $aa
cp $LFS/pkglist.txt $aa/iso/arch/pkglist.x86_64.txt
rm $LFS/pacman.sh
# copy bashrc
cp $aa/files/.bashrc $LFS/root/

# copy and move new initramfs and kernel to correct locations
cp $LFS/boot/vmlinuz-linux $aa/iso/arch/boot/x86_64/
mv $LFS/boot/initramfs-linux.img $aa/iso/arch/boot/x86_64/
# remove old kernel and initramfs
rm $aa/iso/arch/boot/x86_64/archiso.img
rm $LFS/boot/initramfs-linux-fallback.img
rm $aa/iso/arch/boot/x86_64/vmlinuz
rm $LFS/boot/vmlinuz
# creation of the new compressed root file system and removal of uncompressed new file system
cd iso/arch/x86_64/
mksquashfs squashfs-root airootfs.sfs -b 1024k -comp xz
rm -rvf squashfs-root
md5sum airootfs.sfs > airootfs.md5

cd $aa
        # this is a huge part to distiguish the name of your distro at boot
	# modifing the syslinux boot screen
	# and i also must make a fix for UEFI here # soon
        archiso_label=$(<$aa/iso/loader/entries/archiso-x86_64.conf awk 'NR==5{print $NF}' | sed 's/.*=//')
        archiso_hex=$(<<<"$archiso_label" xxd -p)
        iso_hex=$(<<<"$iso_label" xxd -p)
        cp "$aa"/boot/splash.png iso/arch/boot/syslinux
        cp "$aa"/boot/iso/archiso_head.cfg iso/arch/boot/syslinux
        sed -i "s/$archiso_label/$iso_label/;s/Arch Linux archiso/Anarchy Linux/" iso/loader/entries/archiso-x86_64.conf
        sed -i "s/$archiso_label/$iso_label/;s/Arch Linux/Anarchy Linux/" iso/arch/boot/syslinux/archiso_sys.cfg
        sed -i "s/$archiso_label/$iso_label/;s/Arch Linux/Anarchy Linux/" iso/arch/boot/syslinux/archiso_pxe.cfg
        sed -i 's/vmlinuz/vmlinuz-linux/' iso/loader/entries/archiso-x86_64.conf
        sed -i 's/archiso.img/initramfs-linux.img/' iso/loader/entries/archiso-x86_64.conf
        sed -i 's/vmlinuz/vmlinuz-linux/' iso/arch/boot/syslinux/archiso_pxe.cfg
        sed -i 's/archiso.img/initramfs-linux.img/' iso/arch/boot/syslinux/archiso_pxe.cfg
        sed -i 's/vmlinuz/vmlinuz-linux/' iso/arch/boot/syslinux/archiso_sys.cfg
        sed -i 's/archiso.img/initramfs-linux.img/' iso/arch/boot/syslinux/archiso_sys.cfg
        cd iso/EFI/archiso/ || exit
        echo -e "Replacing label hex in efiboot.img...\n$archiso_label $archiso_hex > $iso_label $iso_hex"
        xxd -c 256 -p efiboot.img | sed "s/$archiso_hex/$iso_hex/" | xxd -r -p > efiboot1.img
        if ! (xxd -c 256 -p efiboot1.img | grep "$iso_hex" &>/dev/null); then
                echo "\nError: failed to replace label hex in efiboot.img"
                echo "Press any key to continue" ; read input
        fi
        mv efiboot1.img efiboot.img

cd $aa
	# the command to create the iso file
        xorriso -as mkisofs \
        -iso-level 3 \
        -full-iso9660-filenames \
        -volid "$iso_label" \
        -eltorito-boot isolinux/isolinux.bin \
        -eltorito-catalog isolinux/boot.cat \
        -no-emul-boot -boot-load-size 4 -boot-info-table \
        -isohybrid-mbr iso/isolinux/isohdpfx.bin \
        -eltorito-alt-boot \
        -e EFI/archiso/efiboot.img \
        -no-emul-boot -isohybrid-gpt-basdat \
        -output "$version" \
        iso/

# testing the creation of md5 checksums
echo "Generating ISO checksums..."
        md5_sum=$(md5sum "$version" | awk '{print $1}')
        sha1_sum=$(sha1sum "$version" | awk '{print $1}')
        timestamp=$(timedatectl | grep "Universal" | awk '{print $4" "$5" "$6}')
        echo "Checksums generated. Saved to $(sed 's/.iso//' <<<"$version")-checksums.txt"
        echo -e "- Anarchy Linux is licensed under GPL v2\n- Webpage: http://anarchy-linux.org\n- ISO timestamp: $timestamp\n- $version Official Check Sums:
        * md5sum: $md5_sum
        * sha1sum: $sha1_sum" > "$(sed 's/.iso//' <<<"$version")-checksums.txt"

cd $aa
# optionaly remove the iso directory where all the work was done and clean up
# comment out if needed
rm -rf iso/ mnt/
