#!/bin/bash
set -e

echo "[+] Installing Kea DHCP4..."
apt-get update
apt-get install -y kea-dhcp4-server

echo "[+] setting up Kea..."
cp /configs/kea-dhcp4.conf /etc/kea/kea-dhcp4.conf
chown root:root /etc/kea/kea-dhcp4.conf
chmod 644 /etc/kea/kea-dhcp4.conf

echo "[+] enabling DHCP4..."
ip link set enp0s9 up || true
systemctl enable kea-dhcp4-server
systemctl restart kea-dhcp4-server

echo "[+] DHCP provisioning done!"