#!/bin/bash

# Copy dotfiles
echo "Copy dotfiles.."
cp -r dotfilez/* "$HOME/"

# Install requirements
echo "Install requirements.."
sudo pacman -Syyu && sudo pacman -S foot rofi waybar starship fish swaybg swaylock swayidle rofi-wayland wl-clipboard cliphist wireplumber pavucontrol networkmanager otf-font-awesome ttf-jetbrains-mono-nerd noto-fonts noto-fonts-cjk noto-fonts-emoji fnm firefox nautilus 7zip mpv feh git micro jdk-openjdk fuse opencode podman podman-compose ufw timeshift mako

# Enable Firewall
echo "Enable Firewall.."
sudo ufw enable

# Install Sublime Text
echo "Install Sublime Text.."
curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
sudo pacman -Syyu sublime-text

# Install AUR Helper (PARU)
echo "Install AUR Helper (PARU).."
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

# Install AUR Packages
echo "Install AUR Packages.."
paru -S b43-firmware swayfx
