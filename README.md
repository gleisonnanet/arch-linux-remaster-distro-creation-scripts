# arch-linux-remaster-distro-creation-scripts

## facebook group for questions and answers
[linux from source facebook group](https://www.facebook.com/groups/linuxfromsourcecode/)

![alt text](https://github.com/ChrisSaturn/arch-linux-remaster-distro-creation-scripts/blob/master/screenshots/arch-remaster-distro-creation.png)

## note:: support for UEFI is broken, only legacy boot untill this sentence is updated

description: simple bash scripts to remaster an arch linux based distro for customization or disrro creation.
and also the default configuration of these scritps will be for the creation of anarkhos linux, my personal arch based distro.
you can use everything as an example.

## simple instructions: these scripts will require root or sudo

## requirments: an arch based distro installed as your main system
to check missing dependencies with depends.sh 
make sure to run depends.sh to save alot of time
and take a look at the scripts with an editor like nano, mre informatin in scripts

## 1: run the wget script to fetch the arch linux iso, edit this file to change iso's

./wget.sh

## 2: run the prepare script to mount the arch linux iso to a directory named mnt/ and copy contents to iso/ in project home, and also unsquash file system # change if using different arch based distro

./prepare.sh

## 3: run the copyscripts script to copy a bash script named pacman.sh to the root arch linux file system
## copy over all files, configs and custom stuff to the system your creating
./copyscripts.sh

## 4: run the chroot script to chroot into the arch linux file system
## enter main chroot into distro your making
./chroot.sh

note: your command prompt will change. it will say chroot

## 5: run the pacman script that will install xfce4 by default, you can edit this file
## this pacman.sh will be the main command to install pakages either manually by editing or creating a pkglist.txt file
./pacman.sh

note: creating pkglist.txt on an arch based distro =  pacman -Qqen > pkglist.txt
command to install pkglist.txt = pacman -S - < pkglist.txt
edit pacman.sh accordingly to your wishes

## exit chroot = CTR_D or type exit

note: make sure your command prompt goes back to normal, if it does not press CTR-D or type exit again untill it does.

## 7: unmount the arch linux file system, this step is important, run the unmount script two or three times.

./umount.sh

./umount.sh

## 8: running the generate iso script, this will create the new arch linux iso

note : the bigger the new system, the longer this will take and uses alot of cpu power.

./generate-iso.sh

## 9: creating a bootable usb or cd of the new arch linux distro.

note: if your reading this i may not have to explain how to create a bootable linux medium but i will anyway

bootable usb by command line: and note: dont get screw this up it will first overwrite all stuff on usb drive and second if wrong could wipe your root drive or 
something else important. type lsblk to identify your usb drive after you plug it in. the type the dd command to start creating the bootable usb drive:
replace of=/dev/sdx with the identifed usb device, replace the /dev/sdx with the correct device.

lsblk

dd if=arch-remaster-x86_64.iso of=/dev/sdx status=progress

## you you dont feel confident to do it from the command line you can always use any famous graphical programs to create a bootable us or cd

### ENJOY

## written by chris saturn


