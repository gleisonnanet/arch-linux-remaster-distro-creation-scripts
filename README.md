# arch-linux-iso-remaster-scripts

![alt text](h)

description: simple bash scripts to remaster an offiacial arch linux iso

simple instructions: these scripts will require root or sudo

## 1: run the wget script to fetch the arch linux iso, edit this file to change iso's

./wget.sh

## 2: run the prepare script to mount the arch linux iso to a directory named mnt/ and copy contents to iso/ in project home, and also unsquash file system

./prepare.sh

## 3: run the copyscripts script to copy a bash script named pacman.sh to the root arch linux file system

./copyscripts.sh

## 4: run the chroot script to chroot into the arch linux file system

./chroot.sh

note: your command prompt will change. it will say chroot

## 5: run the pacman script that will install xfce4 by default, you can edit this file

./pacman.sh

## exit chroot = CTR_D or type exit

note: make sure your command prompt goes back to normal, if it does not press CTR-D or type exit again untill it does.

## 7: unmount the arch linux file system, this step is important, run the unmount script two or three times.

./umount.sh

./umount.sh

## 8: running the generate iso script, this will create the new arch linux iso

./generate-iso.sh

## 9: creating a bootable usb or cd of the new anarchy-2.0.0-x86_64.iso version 2.

note: if your reading this i may not have to explain how to create a bootable linux medium but i will anyway

bootable usb by command line: and note: dont get screw this up it will first overwrite all stuff on usb drive and second if wrong could wipe your root drive or 
something else important. type lsblk to identify your usb drive after you plug it in. the type the dd command to start creating the bootable usb drive:
replace of=/dev/sdx with the identifed usb device, replace the /dev/sdx with the correct device.

lsblk

dd if=anarchy-2.0.0-x86_64.iso of=/dev/sdx status=progress

## you you dont feel confident to do it from the command line you can always use any famous graphical programs to create a bootable us or cd

### ENJOY

![alt text](h)

## written by chris saturn


