#!/bin/bash

echo "!WARNING! This script assumes you're on an Arch-based distro and have yay or paru installed..."
sleep 2
echo "git is required !!"
sleep 5
echo "Cloning Github repository"
git clone https://github.com/Fhraze/dotfiles-riverwm.git
cd dotfiles-riverwm

# Install packages
echo "Installing packages"
for P in $( <./packages)
do
  sudo pacman -S ${P} --needed --noconfirm
  yay -S ${P} --needed --noconfirm
  paru -S ${P} --needed --noconfirm
done

# Copy config files, binaries, fonts and icons
echo "Copying config files..."
sleep 2
sudo mkdir -p /usr/share/terminator
sudo cp -v home/.config/terminator/terminal-borders-nice.png /usr/share/terminator
mkdir ~/.config
mkdir ~/.local
cp -r -v home/.local home/.config home/.zshrc ~/

# Change user's default shell to zsh
echo "Changing default shell to zsh"
chsh -s /bin/zsh

echo "Cleaning cloned repository"
cd ..
rm -rf dotfiles-riverwm
