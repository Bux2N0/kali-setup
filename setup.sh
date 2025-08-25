#!/bin/bash

# Set keyboard layout
setxkbmap -layout de

# Update and install necessary packages
sudo apt update
sudo apt install xinput -yy

# Enable natural scrolling and tap-to-click
xinput --set-prop 9 "libinput Natural Scrolling Enabled" 1
xinput --set-prop 9 "libinput Tapping Enabled" 1

# Change root password to 'root'
echo "root:root" | chpasswd
echo -e "\033[1;31mroot password changed to root!\033[0m"

# Ask user for a new IP address (or press Enter to keep current IP)
read -p "Enter a new IP address (or press Enter to keep current IP): " new_ip

# If user provides a new IP address, change it
if [ ! -z "$new_ip" ]; then
    # Flush the current IP and add the new one
    sudo ip addr flush dev wlan0
    sudo ip addr add "$new_ip/24" dev wlan0
    sudo ip route add default via 192.168.2.1
    echo -e "\033[1;32mIPv4 Address changed to: $new_ip\033[0m"
else
    echo -e "\033[1;32mNo IP change. Current IP is: $(hostname -I | awk '{print $1}')\033[0m"
fi


# Prompt user to install additional packages
read -p "Would you like to install any additional packages? (Enter package names, or press Enter to skip): " package_names

# If the user enters package names, install them
if [ ! -z "$package_names" ]; then
    echo "Installing packages: $package_names"
    sudo apt install -y $package_names
    echo -e "\033[1;32mPackages installed successfully!\033[0m"
else
    echo -e "\033[1;32mNo packages were installed.\033[0m"
fi

# End of script
echo -e "\033[1;32mSetup complete!\033[0m"

# Show current IPv4 address
echo "Current IPv4 Address: $(hostname -I | awk '{print $1}')"
