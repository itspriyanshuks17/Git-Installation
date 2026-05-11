# Install AWS CLI on Fedora Linux using this script:

```bash id="j2d9pf"
#!/bin/bash

# Install AWS CLI v2 on Fedora

set -e

echo "Updating system packages..."
sudo dnf update -y

echo "Installing unzip and curl..."
sudo dnf install -y unzip curl

echo "Downloading AWS CLI..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

echo "Extracting package..."
unzip -o awscliv2.zip

echo "Installing AWS CLI..."
sudo ./aws/install

echo "Cleaning up..."
rm -rf aws awscliv2.zip

echo "AWS CLI installed successfully!"
echo "Version:"
aws --version
```

Save as:

```bash id="yo29f1"
install-aws-cli.sh
```

Make executable:

```bash id="z2s9af"
chmod +x install-aws-cli.sh
```

Run:

```bash id="jwp1gs"
./install-aws-cli.sh
```

Official documentation:

[AWS CLI Install Guide for Linux](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html?utm_source=chatgpt.com)

After installation, configure credentials:

```bash id="ks9c3m"
aws configure
```

You’ll be asked for:

* AWS Access Key ID
* AWS Secret Access Key
* Default region (example: `ap-south-1`)
* Output format (`json`)
