#!/bin/bash
java_version=17
data_disk_size='40 GiB'
data_disk=$(fdisk -l | grep "$data_disk_size" | head -n 1 | awk '{print $2}' | sed 's/://')
data_disk_mount_point=/mc
data_disk_uuid=`blkid | grep $data_disk | sed 's/UUID=/ /g' | sed 's/"/ /g' | awk '{print $2}'`

echo [1] --- Mounting data disk...
echo ---------data disk uuid=$data_disk_uuid
echo ---------creating mount point and mount
mkdir $data_disk_mount_point
mount $data_disk $data_disk_mount_point

echo ---------altering fstab
cp /etc/fstab /etc/fstab.bak
echo UUID=$data_disk_uuid $data_disk_mount_point ext4 defaults 0 0
echo UUID=$data_disk_uuid $data_disk_mount_point ext4 defaults 0 0 >> /etc/fstab
echo ---------reloading daemon
systemctl daemon-reload

echo ---------installing packages
apt update
apt install git openjdk-$java_version-jre screen htop screenfetch -y

echo ---------installing ossutils

sudo -v ; curl https://gosspublic.alicdn.com/ossutil/install.sh | sudo bash

echo ---------cloning seati ossutils

cd ~
git clone https://github.com/seatitanium/oss.git
cd oss
chmod +x *
chmod +x ./backup/*
chmod +x ./utils/*
cp ~/server-scripts/oss.ini ~/oss

echo ---------downloading server content
cd ~/oss
./oss cp oss://seatibackup/archive/ /mc/server
cd /mc/server
chmod +x *

echo ---------starting server
cd ~/server-scripts
screen -dm -S reboot ./auto-reboot.sh

echo ---
echo Deployment OK at $(date "+%Y-%m-%d %H:%M:%S")
echo ---