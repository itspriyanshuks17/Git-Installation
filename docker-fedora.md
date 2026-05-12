# Install Docker on Fedora Linux with this script:

```bash id="n4x2qa"
#!/bin/bash

# Install Docker on Fedora

set -e

echo "Updating system..."
sudo dnf update -y

echo "Installing dnf plugins..."
sudo dnf install -y dnf-plugins-core

echo "Adding Docker repository..."
sudo dnf config-manager addrepo --from-repofile=https://download.docker.com/linux/fedora/docker-ce.repo

echo "Installing Docker..."
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Starting Docker service..."
sudo systemctl enable --now docker

echo "Adding current user to docker group..."
sudo usermod -aG docker $USER

echo "Docker installation completed!"
echo "Please log out and log back in for group changes to take effect."

echo "Docker version:"
docker --version
```

Save as:

```bash id="4pm8xk"
install-docker.sh
```

Make executable:

```bash id="r9q1mu"
chmod +x install-docker.sh
```

Run:

```bash id="m8x4zt"
./install-docker.sh
```

Verify Docker works:

```bash id="2q0uyl"
docker run hello-world
```

Official docs:

[Docker Engine on Fedora Documentation](https://docs.docker.com/engine/install/fedora/?utm_source=chatgpt.com)
