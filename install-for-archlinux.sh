#!/bin/bash

echo "this script assumes you're on an Arch-based distro and have yay installed..."
sleep 5

# Install packages
yay -S zsh river thunar audacious grim slurp wl-clipboard dunst eww-wayland terminator wofi wofi-emoji playerctl fastfetch swaybg ripgrep fd eza pipewire pipewire-pulse wireplumber --needed

# Copy config files, binaries, fonts and icons
cp -r local/bin ~/.local/.
cp -r local/fonts ~/.local/.
sudo cp -r usrshare/icons /usr/share/.
cp zshrc ~/.zshrc

# Change user's default shell to zsh
chsh -s /bin/zsh
