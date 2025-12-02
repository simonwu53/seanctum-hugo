# Deployment Guide: Seanctum.space

This repository contains the source code for [seanctum.space](https://seanctum.space). The site is built using **Hugo** (Static Site Generator) and deployed to a personal VPS running **Nginx**.

## 1. Prerequisites

### Local Machine (macOS)
* **Hugo:** `brew install hugo`
* **Rsync:** Pre-installed on macOS.
* **SSH Key:** Your public key must be added to `~/.ssh/authorized_keys` on the VPS for password-less deployment.

### Remote Server (VPS)
* **OS:** Ubuntu/Debian
* **Web Server:** Nginx
* **Dependencies:** `rsync` must be installed.
  
    ```bash
    sudo apt update && sudo apt install rsync
    ```

## 2. Server Architecture

* **Web Root:** `/var/www/seanctum/`
* **Nginx Config:** `/etc/nginx/sites-available/www.seanctum.space`
* **SSL:** Namecheap SSL (Managed via Namecheap SSL Manager)
* **User:** `shan` (Must have ownership of the Web Root)

### Initial Permissions Setup (One-time)
If permission errors occur during deployment, ensure the user `shan` owns the web directory:

```bash
sudo chown -R shan:shan /var/www/seanctum
sudo chmod -R 755 /var/www/seanctum
```