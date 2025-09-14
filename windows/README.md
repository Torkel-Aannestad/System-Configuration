# Win11 setup
- Currently there is no automated setup of scripts or env files for windows.

## WSL
- WSL is installed manually
- Set up SSH
- Clone this repo to WSL and run Linux setup

## VS code

- Command palett select Connect to WSL

## Docker

- https://learn.microsoft.com/en-us/windows/wsl/tutorials/wsl-containers
- Open Docker Desktop and settings -> choose "Use WSL based engine"

## Guide for remote

- Create local user
  - Account -> Other users -> Don't have email -> Add without account
  - Set insane PW
- RDP
  - Settings -> System -> Remote Destop -> ON
  - Add user -> your newly created user
- Connect to Tailscale
  - Get device name from Tailscale
- Connect from remote to tailscale device name
- Set up local user
  - Browser
  - Connect to accounts
  - Remote connection software
  - PW manager

## Kanata

- Add kanata_gui.exe to program files
  - C:\Program Files\Kanata
- Add shortcut to kanata_gui.exe to startup folder
  - C:\Users\TorkelAannestad\AppData\Roaming\Microsoft\Windows\Start Menu\Programs
- Config files are installed "run-env.ps1"
