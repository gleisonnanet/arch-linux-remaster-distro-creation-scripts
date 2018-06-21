########################################################################
# this file is for easy wget of arch based distro to remaster.
# just uncomment line you want and comment lines you dont want.
#######################################################################
. ./config.sh # global config file holding certain varibles for scripts

cd $aa

# wget command for official arch linux iso ( about 800mb )
wget http://mirrors.acm.wpi.edu/archlinux/iso/2018.06.01/archlinux-2018.06.01-x86_64.iso

# wget command for the official black arch linux iso. ( over 6 gigs )
#wget http://mirror.math.princeton.edu/pub/blackarch/iso/blackarch-linux-live-2018.06.01-x86_64.iso

# wget old archlabs
# wget https://sourceforge.net/projects/archlabs-linux-minimo/files/ArchLabsMinimo/archlabs-2018-02.iso
