#!/usr/bin/env bash
# ensure the script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Install ufw
apt-get update
apt-get install -y ufw

# Reset ufw to default settings
ufw reset

# Set default policies
ufw default deny incoming
ufw default allow outgoing

# Allow specific ports
ufw allow 22/tcp
ufw allow 443/tcp
ufw allow 80/tcp

# Enable ufw
ufw --force enable

# Display ufw status
ufw status verbose
