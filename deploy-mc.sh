# Deploy Minecraft instance

java_version=17
data_disk=/dev/nvme1n1
data_disk_mount_point=/mc

# Install dependencies
apt update && apt install openjdk-$java_version-jre screen htop screenfetch -y

# Format data disk
mkfs.ext4 $data_disk

# Mount data disk to /mc
data_disk_uuid=`blkid | grep $data_disk | sed 's/UUID=/ /g' | sed 's/"/ /g' | awk '{print $2}'`
mkdir $data_disk_mount_point
mount $data_disk $data_disk_mount_point
cp /etc/fstab /etc/fstab.bak
echo UUID=$data_disk_uuid $data_disk_mount_point ext4 defaults 0 0 >> /etc/fstab
systemctl daemon-reload