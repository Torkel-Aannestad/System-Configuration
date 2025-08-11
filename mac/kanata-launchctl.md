#Kanata for Mac
- Use the following guide to setup kanata for Mac. The official docs are a little flaky.
  - https://github.com/jtroo/kanata/discussions/1537
1. You will need to install "Karabiner-DriverKit-VirtualHIDDevice" to run it. Otherwise you'll get errors when running the banary. https://github.com/pqrs-org/Karabiner-DriverKit-VirtualHIDDevice/tree/main/dist
2. brew install kanata

## Setup lauchctl for auto launch on startup
- First run the "run-scripts" and "run-env"
  - kanata-config.kbd and kanata-launchctl files are then copies into place
- Run "kanata-launchctl-setup-commands"
- Run following to start manually

Start vhiddaemon and vhidmanager manually
```shell
sudo launchctl load /Library/LaunchDaemons/com.torkelaannestad.kanata.plist
sudo launchctl load /Library/LaunchDaemons/com.torkelaannestad.karabiner-vhiddaemon.plist
sudo launchctl load /Library/LaunchDaemons/com.torkelaannestad.karabiner-vhidmanager.plist

sudo launchctl start com.torkelaannestad.kanata
sudo launchctl start com.torkelaannestad.karabiner-vhiddaemon
sudo launchctl start com.torkelaannestad.karabiner-vhidmanager
```


## Bonus: check if plist file is loaded in launchd
```shell
sudo launchctl list | grep com.torkelaannestad
```
