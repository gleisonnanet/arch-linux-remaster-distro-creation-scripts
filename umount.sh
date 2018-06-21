######################################################
#
######################################################
. ./config.sh

cd $aa

umount $LFS
umount $LFS/proc
umount $LFS/sys
umount $LFS/dev/pts
umount -l $LFS/dev
umount -l $LFS
umount -f $LFS
umount -l mnt/
umount -f mnt/
