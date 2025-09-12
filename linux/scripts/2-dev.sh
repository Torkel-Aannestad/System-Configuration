#!/usr/bin/bash

set -e  # exit script if a command fails

sudo apt-get -y update

echo ""
echo "starting install..."

sudo apt-get install -y python3-pip
sudo apt-get install -y ca-certificates
sudo apt-get install -y lazygit
sudo apt-get install -y zsh-autosuggestions
sudo apt-get install -y protobuf-compiler
protoc --version

echo ""
echo "done dev install"
