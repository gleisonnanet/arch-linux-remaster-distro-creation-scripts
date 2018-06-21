######################################################
# this is the main pacman command to upgrade and install packages inside chroot
# of the arch based dirto you want to create or remaster
######################################################

# alot of these commands are needed and are important
# needed
pacman-key --init

pacman-key --populate archlinux

# change mirrorlist to USA # comment out if unneeded
awk '/^## United States$/{f=1}f==0{next}/^$/{exit}{print substr($0, 2)}' /etc/pacman.d/mirrorlist
sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist

# this is the command to uprgrade and install list of packages
pacman -Syu --force archiso linux - < pkglist.txt

mkinitcpio -p linux





