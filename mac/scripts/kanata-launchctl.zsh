#!/bin/zsh

set -e
run=true

if [[ "$run" == "true" && -e /Library/LaunchDaemons/com.torkelaannestad.kanata.plist && -e  /Library/LaunchDaemons/com.torkelaannestad.karabiner-vhiddaemon.plist && -e /Library/LaunchDaemons/com.torkelaannestad.karabiner-vhidmanager.plist ]]; then

#Configure starting Kanata for LaunchCtl
echo "com.torkelaannestad.kanata.plist"
sudo launchctl bootstrap system /Library/LaunchDaemons/com.torkelaannestad.kanata.plist
sudo launchctl enable system/com.torkelaannestad.kanata.plist

#Configure starting Karabiner-DriverKit-VirtualHIDDevice for LaunchCtl
echo "com.torkelaannestad.karabiner-vhiddaemon.plist"
sudo launchctl bootstrap system /Library/LaunchDaemons/com.torkelaannestad.karabiner-vhiddaemon.plist
sudo launchctl enable system/com.torkelaannestad.karabiner-vhiddaemon.plist

echo "com.torkelaannestad.karabiner-vhidmanager.plist"
sudo launchctl bootstrap system /Library/LaunchDaemons/com.torkelaannestad.karabiner-vhidmanager.plist
sudo launchctl enable system/com.torkelaannestad.karabiner-vhidmanager.plist
else
    echo "run is false or files don´t exist"
    echo "skipping kanata-launchctl"
fi
