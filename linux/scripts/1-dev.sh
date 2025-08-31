#!/usr/bin/bash

set -e  # exit script if a command fails

sudo apt-get -y update

echo ""
echo "starting install..."
sudo apt-get install -y git
sudo apt-get install -y btop
sudo apt-get install -y curl
sudo apt-get install -y wget
sudo apt-get install -y fzf
sudo apt-get install -y batcat 
sudo apt-get install -y fd-find
sudo apt-get install -y ripgrep
sudo apt-get install -y jq
sudo apt-get install -y xclip
sudo apt-get install -y tldr
sudo apt-get install -y python3-pip
sudo apt-get install -y ca-certificates
sudo apt-get install -y lazygit
sudo apt-get install -y protobuf-compiler
protoc --version 

echo ""
echo "done dev install"
