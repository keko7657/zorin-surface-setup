#!/bin/bash

echo "==> System wird aktualisiert..."
sudo apt update && sudo apt upgrade -y

echo "==> Notwendige Pakete werden installiert..."
sudo apt install -y curl wget gnome-software-plugin-flatpak gnome-software-plugin-snap flatpak   gnome-shell-extensions gnome-tweaks git timeshift tlp tlp-rdw iw ethtool

echo "==> Energiesparmodus aktivieren..."
sudo systemctl enable tlp

echo "==> Windows 10 Design anwenden..."
flatpak install -y flathub org.gnome.Extensions
git clone https://github.com/B00merang-Project/Windows-10 /root/.themes/Windows-10
git clone https://github.com/B00merang-Artwork/Windows-10-Icons /root/.icons/Windows-10-Icons

echo "==> Linux Surface Repository wird hinzugefügt..."
curl -s https://raw.githubusercontent.com/linux-surface/linux-surface/master/pkg/add.sh | bash

echo "==> Surface-spezifische Pakete werden installiert..."
sudo apt update
sudo apt install -y linux-image-surface linux-headers-surface iptsd libwacom-surface

echo "==> Konfiguration abgeschlossen. Bitte neu starten."