#!/bin/sh
#
# Set the wallpaper from a list

# export DBUS_SESSION_BUS_ADDRESS environment variable
PID=$(pgrep cinnamon-sessio)
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2-)

BASE="file:///home/nazarii/wallpapers/" # enter file://path_to_directory_with_wallpapers
LIST=`ls /home/nazarii/wallpapers` # enter ls path_to_directory_with_wallpapers
#echo $LIST

# The current wallpaper
current=`gsettings get org.cinnamon.desktop.background picture-uri`

# loop over the list until we find a match
matched=0
new=""
for wp in $LIST
do
    #echo $wp
    if [ $matched -eq 1 ]
    then
        new="${BASE}${wp}"
        break
    elif [ "'${BASE}${wp}'" = "${current}" ]
    then
        matched=1
    fi
done

# if "$new" is blank, then we show the first shot
if [ "$new" = "" ]
then
    new=${BASE}`echo $LIST | awk '{print $1;}'`
fi

#echo $new
# set the wallpaper
gsettings set org.cinnamon.desktop.background picture-uri \'$new\'
