######################################################
# this file is to extract the arch based distro you want to remaster
# if needed change the extraction command to extract arch based distro you want.
######################################################

. ./config.sh # global config file holding certain varibles for scripts

cd $aa

# if different distro change here
7z x "archlinux-2018.06.01-x86_64.iso" -o"$iso"

# sometimes this cd command is different for other arch based distro's
cd iso/arch/x86_64/
# unsquash root file system
unsquashfs airootfs.sfs
# remove old compressed root file system
rm airootfs.sfs
