#!/bin/bash

set -e

echo "==> System wird aktualisiert..."
sudo apt update && sudo apt -y upgrade

echo "==> Notwendige Pakete werden installiert..."
sudo apt install -y curl git wget gnome-tweaks gnome-shell-extensions tlp timeshift flatpak gnome-software-plugin-flatpak gnome-software-plugin-snap

echo "==> Energiesparmodus aktivieren..."
sudo systemctl enable tlp
sudo systemctl start tlp

echo "==> Windows 10 Design anwenden..."
flatpak install -y flathub org.gnome.Extensions
mkdir -p ~/.themes ~/.icons
git clone https://github.com/B00merang-Project/Windows-10.git ~/.themes/Windows-10
git clone https://github.com/B00merang-Artwork/Windows-10-Icons.git ~/.icons/Windows-10-Icons

echo "==> Linux Surface Repository wird hinzugefügt..."
curl -s https://packagecloud.io/install/repositories/linux-surface/linux-surface/script.deb.sh | sudo bash
sudo apt install -y linux-image-surface linux-headers-surface iptsd libwacom-surface

echo "==> Programme werden installiert..."
sudo apt install -y firefox qbittorrent vlc gimp libreoffice

echo "==> Flatpak Apps installieren (z. B. Twitch-Client)..."
flatpak install -y flathub com.github.tchx84.Flatseal
flatpak install -y flathub com.obsproject.Studio

echo "==> Aufräumen..."
sudo apt autoremove -y

echo "==> Einrichtung abgeschlossen! Ein Neustart ist empfohlen."
