#!/bin/bash

# Para usar el script ejecuta en la terminal:
# chmod +x fedora-dev-setup.sh
# ./fedora-dev-setup.sh


echo "🔧 Iniciando configuración de entorno para Fedora..."

# Activar RPM Fusion
echo "➕ Habilitando repositorios RPM Fusion..."
sudo dnf install -y \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Actualizar sistema
echo "📦 Actualizando sistema..."
sudo dnf update -y

# Instalar utilidades generales
echo "🔧 Instalando herramientas básicas..."
sudo dnf install -y git curl wget neofetch htop gnome-tweaks gnome-extensions-app

# Instalar códecs multimedia
echo "🎵 Instalando códecs multimedia..."
sudo dnf groupupdate -y multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate -y sound-and-video

# Instalar VS Code (Microsoft repo)
echo "💻 Instalando VS Code..."
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf install -y code

# Instalar DBeaver
echo "🛢️ Instalando DBeaver CE..."
sudo dnf install -y https://dbeaver.io/files/dbeaver-ce-latest-stable.x86_64.rpm

# Activar Flatpak + Flathub
echo "📦 Habilitando Flatpak y Flathub..."
sudo dnf install -y flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# (Opcional) MongoDB Compass AppImage
echo "📦 Descargando MongoDB Compass AppImage..."
mkdir -p $HOME/Apps
cd $HOME/Apps
wget -O mongodb-compass.AppImage https://downloads.mongodb.com/compass/mongodb-compass-latest-x86_64.AppImage
chmod +x mongodb-compass.AppImage

echo -e "\n✅ Todo listo. Puedes ejecutar MongoDB Compass con:"
echo "$HOME/Apps/mongodb-compass.AppImage"
