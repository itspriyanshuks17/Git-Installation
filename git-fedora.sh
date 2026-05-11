#!/bin/bash

# Install Visual Studio Code on Fedora

echo "Importing Microsoft GPG key..."
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

echo "Adding VS Code repository..."
sudo tee /etc/yum.repos.d/vscode.repo > /dev/null <<EOF
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF

echo "Updating package cache..."
sudo dnf check-update

echo "Installing VS Code..."
sudo dnf install -y code

echo "Installation complete!"
echo "Run VS Code using: code"
