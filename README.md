# Git Installation and Setup Guide

This README provides instructions for installing Git on Windows and Linux and guides you through the initial configuration process.

---

## Table of Contents

1. [Installing Git on Windows](#installing-git-on-windows)
2. [Installing Git on Linux](#installing-git-on-linux)
3. [Configuring Git](#configuring-git)
4. [Further Process](#further-process)
5. [Handling Authentication Issues](#handling-authentication-issues)

---

## Installing Git on Windows

### Step 1: Download Git
1. Visit the [official Git website](https://git-scm.com/).
2. Click on "Download for Windows" to get the latest version of Git.

### Step 2: Run the Installer
1. Locate the downloaded installer file (e.g., `Git-<version>-64-bit.exe`) and double-click to run it.
2. Follow the installation wizard steps:
   - Select the components you want to install (leave defaults unless you know what to change).
   - Choose the text editor for Git (default is Vim, but you can select others like Notepad++ or VS Code).
   - Set the default branch name (keep as `main` unless specified otherwise).
   - Adjust other settings as needed, then click "Install."

### Step 3: Verify Installation
1. Open a command prompt or terminal.
2. Type:
   ```bash
   git --version
   ```
   If Git is installed correctly, the version number will be displayed.

---

## Installing Git on Linux

### Step 1: Update System Packages
Run the following command to ensure your system is up to date:
```bash
sudo apt update && sudo apt upgrade  # For Debian/Ubuntu-based systems
sudo dnf update                     # For Fedora-based systems
sudo yum update                     # For RHEL-based systems
```

### Step 2: Install Git
Use the appropriate command for your distribution:
- **Debian/Ubuntu**:
  ```bash
  sudo apt install git
  ```
- **Fedora**:
  ```bash
  sudo dnf install git
  ```
- **RHEL/CentOS**:
  ```bash
  sudo yum install git
  ```

### Step 3: Verify Installation
1. Open a terminal.
2. Type:
   ```bash
   git --version
   ```
   If Git is installed correctly, the version number will be displayed.

---

## Configuring Git

After installing Git, configure it with your username and email address:

### Step 1: Set Username and Email
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### Step 2: Verify Configuration
Run the following command to view the configuration:
```bash
git config --list
```

### Optional: Set Default Branch Name
To ensure consistency, set the default branch name to `main`:
```bash
git config --global init.defaultBranch main
```

---

## Further Process

### Step 1: Create a New Repository
1. Navigate to the directory where you want to initialize the repository:
   ```bash
   cd /path/to/your/project
   ```
2. Initialize the repository:
   ```bash
   git init
   ```

### Step 2: Add Files to the Repository
Add files to the staging area:
```bash
git add .
```

### Step 3: Commit Changes
Create the first commit:
```bash
git commit -m "Initial commit"
```

### Step 4: Connect to a Remote Repository
If you are using a remote repository (e.g., GitHub):
1. Create a repository on the platform (e.g., GitHub).
2. Add the remote repository URL:
   ```bash
   git remote add origin https://github.com/username/repository.git
   ```

### Step 5: Push Changes
Push the changes to the remote repository:
```bash
git push -u origin main
```

---

## Handling Authentication Issues

GitHub removed password-based authentication for HTTPS URLs as of August 13, 2021. Instead, use **Personal Access Tokens (PATs)** or SSH for authentication.

### Using a Personal Access Token (PAT)
#### Step 1: Generate a PAT
1. Log in to GitHub.
2. Go to **Settings** → **Developer settings** → **Personal access tokens** → **Tokens (classic)** → **Generate new token**.
3. Select the necessary scopes (e.g., `repo` for repository access).
4. Generate and copy the token. Save it securely.

#### Step 2: Use the Token
When prompted for your GitHub credentials during `git push`:
- **Username**: Your GitHub username (e.g., `vaish105`).
- **Password**: The Personal Access Token.

#### Step 3: Update Remote URL (Optional)
To save the token permanently:
```bash
git remote set-url origin https://<username>:<personal_access_token>@github.com/<username>/<repository>.git
```

### Using SSH Authentication
1. Generate an SSH key:
   ```bash
   ssh-keygen -t ed25519 -C "your_email@example.com"
   ```
2. Add the key to GitHub:
   - Copy the public key:
     ```bash
     cat ~/.ssh/id_ed25519.pub
     ```
   - Go to **Settings** → **SSH and GPG keys** → **New SSH Key** and paste the key.
3. Update the Git remote URL to SSH:
   ```bash
   git remote set-url origin git@github.com:username/repository.git
   ```
4. Test it:
   ```bash
   git push origin main
   ```

---

## Troubleshooting

If you encounter issues during installation or setup, refer to the [Git documentation](https://git-scm.com/doc) or check your system logs for errors.

Happy coding!

