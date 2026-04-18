#!/bin/bash

# Copy dotfiles
echo "Copy dotfiles.."
cp -r /* "$HOME/"

# Install requirements
echo "Install requirements.."
sudo pacman -Syyu && sudo pacman -S foot rofi waybar starship fish swaybg swaylock swayidle rofi-wayland wl-clipboard cliphist wireplumber pavucontrol networkmanager otf-font-awesome ttf-jetbrains-mono-nerd noto-fonts noto-fonts-cjk noto-fonts-emoji fnm firefox nautilus 7zip mpv feh git jdk-openjdk fuse opencode podman podman-compose ufw timeshift mako code

# Enable Firewall
echo "Enable Firewall.."
sudo ufw enable

# Install AUR Helper (PARU)
echo "Install AUR Helper (PARU).."
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

# Install AUR Packages
echo "Install AUR Packages.."
paru -S b43-firmware swayfx
