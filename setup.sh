#!/bin/bash

# Function to install an app
install_app() {
    echo "Installing $1..."
    pamac install --no-confirm $1
}

# Function to prompt for optional apps
prompt_optional() {
    read -p "Do you want to install $1? (y/n): " choice
    case "$choice" in 
        y|Y ) install_app $2;;
        * ) echo "Skipping $1 installation.";;
    esac
}


# System update and upgrade
echo "Checking for system updates..."
sudo pacman -Syu --noconfirm

# Main installation process
echo "Starting Manjaro Development Environment Setup..."

# Essential Apps
install_app code
install_app python-pip
install_app spotify
install_app stacer
install_app todoist
install_app notion
install_app libreoffice-still
install_app vlc
install_app normcap
install_app microsoft-edge-dev

# Optional Apps
prompt_optional "DaVinci Resolve" davinci-resolve
prompt_optional "Dropbox" dropbox
prompt_optional "Android Studio" android-studio

# Browser Selection
read -p "Choose a browser (E/B/C/F/S): " browser_choice
case "$browser_choice" in
    E|e ) install_app microsoft-edge-dev;;
    B|b ) install_app brave;;
    C|c ) install_app google-chrome;;
    F|f ) install_app firefox;;
    S|s ) echo "Skipping browser installation.";;
    * ) echo "Invalid choice. Skipping browser installation.";;
esac

echo "Manjaro Development Environment Setup Complete!"
