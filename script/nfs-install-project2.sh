#!/bin/bash

echo "[STEP1] User getting sudo permission."
sudo chown $USER .

echo "[STEP2] installing nfs-kernel-server"
sudo apt install -y nfs-kernel-server

echo "[STEP3] nfs-server's share directory made."
sudo mkdir /srv/volume-static

echo "[STEP4] config share directory in /etc/exports file."
echo "/srv/volume-static *(rw,sync,no_subtree_check,no_root_squash)" | sudo tee /etc/exports

echo "[STEP5] make an 'index.html' sample file in /srv/volume-static/ directory"
echo "<?php echo "Welcome to MySimpleWeb.<br>"; echo gethostname(), "<br>"; ?>" | sudo tee /srv/volume-static/index.php
echo "<?php echo "Welcome to MySimpleWeb.<br>"; echo gethostname(), "<br>"; ?>" | sudo tee /srv/volume-static/index.html

echo "[STEP6] reload NFS export configs"
sudo exportfs -arv

echo "[STEP7] set firewall policy"
sudo iptables -A INPUT -p tcp --dport 2049 -j ACCEPT
sudo iptables -A INPUT -p udp --dport 2049 -j ACCEPT

echo "nfs-server installation is completed. -------------------------------------------------"

echo 
systemctl status nfs-server.service
echo

echo "/etc/exports file ---------------------------------------------------------------------"
sudo cat /etc/exports
echo 

echo "/srv/volume-static/index.html file -------------------------------------------------------"
cat /srv/volume-static/index.html
echo

echo "list iptables policy ------------------------------------------------------------------"
sudo iptables -nL | head -2
sudo iptables -nL | grep 2049
echo
