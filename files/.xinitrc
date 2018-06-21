# ~/.xinitrc
# This file is sourced when running startx and 
#    other programs which call xinit
# As in all Bash/sh scripts lines starting with 
#    '#' are comments

# Set background to your favorite pic
#xsetbg -fullscreen /morphix/background.png &

# Start a XTerm
/usr/bin/X11/xterm &

# Start the systems window manager.
# See WindowManagers for other choices.
#exec /etc/alternatives/x-window-manager

# To run Gnome instead of system default, place a 
# '#' before the previous line and uncomment the 
# next line.
 exec fluxbox
