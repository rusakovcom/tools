#!/bin/bash
# Tested on Oracle Linux 8/9
# curl -O https://raw.githubusercontent.com/rusakovcom/tools/main/install_gui_on_cli_linux.sh

# Update packages
yum update -y

# Install GUI packages
yum groupinstall -y "Server with GUI"

# Set default target to graphical
systemctl set-default graphical.target

# Reboot the system
reboot

# The same on Ubuntu 22.04: sudo apt update -y && sudo apt install -y ubuntu-desktop && reboot
