###################################################################
# this file will install any missing dependencies on to your host arch linux distro
# important to run this as you could waste alot of time with missing dependency
###################################################################
. ./config.sh


check() {
# Check depends
        if [ ! -f /usr/bin/wget ]; then query="$query wget "; fi
        if [ ! -f /usr/bin/xorriso ]; then query+="libisoburn "; fi
        if [ ! -f /usr/bin/mksquashfs ]; then query+="squashfs-tools "; fi
        if [ ! -f /usr/bin/7z ]; then query+="p7zip " ; fi
        if [ ! -f /usr/bin/arch-chroot ]; then query+="arch-install-scripts "; fi
        if [ ! -f /usr/bin/xxd ]; then query+="xxd "; fi
        if [ ! -f /usr/bin/gtk3-demo ]; then query+="gtk3 "; fi
        if [ ! -f /usr/bin/rankmirrors ]; then query+="pacman-contrib "; fi

        if [ ! -z "$query" ]; then
                echo -en "Error: missing dependencies: ${query}\n > Install missing dependencies now? [y/N]: "
                read -r input
		case $input in
                        y|Y)    sudo pacman -Sy $query ;;
                        *)      echo "Error: missing depends, exiting." ; exit 1 ;;
                esac
        fi
}
check
