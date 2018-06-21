#####################################################################
# this file is the main chroot command = important
# important to after done chroot and exited to run the umount.sh 
# 2 or 3 times # to make sure everything is un mounted.
#####################################################################
. ./config.sh

# usefull chroot command # old

#mount --bind $LFS $LFS
#mount -t proc none $LFS/proc
#mount -t sysfs none $LFS/sys
#mount -o bind /dev $LFS/dev
#mount -o bind /dev/pts $LFS/dev/pts  ## important for pacman (for signature check)

# new more accurate chroot command
mount --bind $LFS $LFS
mount -t proc /proc $LFS/proc
mount --make-rslave --rbind /sys $LFS/sys
mount --make-rslave --rbind /dev $LFS/dev
mount --make-rslave --rbind /run $LFS/run    # (assuming /run exists on the system)
chroot "$LFS" /bin/bash

# copy much needed internet file so internet works in chroot 
# if copyscripts.sh was not run
cp  /etc/resolv.conf $LFS/etc  ## this is needed to use networking within the chroot




