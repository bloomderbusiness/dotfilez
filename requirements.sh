#!/bin/bash

set -e

# Copy dotfiles
echo "Copy dotfiles.."
cp -r .config "$HOME/"
cp -r Images/ "$HOME/"

# Install requirements
echo "Install requirements.."
sudo pacman -Syyu --noconfirm && sudo pacman -S --noconfirm sway foot rofi waybar starship fish swaybg swaylock swayidle rofi-wayland wl-clipboard cliphist wireplumber pavucontrol networkmanager otf-font-awesome ttf-jetbrains-mono-nerd noto-fonts noto-fonts-cjk noto-fonts-emoji fnm firefox nautilus 7zip mpv feh git jdk-openjdk fuse docker docker-compose ufw timeshift mako code fastfetch

# Enable Firewall
echo "Enable Firewall.."
sudo ufw enable

# Config git
echo "Config git.."
git config --global user.name "ottavianowebenterprises"
git config --global user.email "ottavianowebenterprises@gmail.com"


# Install AUR Helper (PARU)
echo "Install AUR Helper (PARU).."
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm


