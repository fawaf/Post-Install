#!/bin/bash
# Enables TRIM for the selected drive

echo "Backing up /etc/fstab..."
sudo cp /etc/fstab ~/fstab-backup &>> $logfile

echo "Adding TRIM support to all ext4 partitions..."
sudo sed -i "s/UUID=\([0-9a-z]*\)-\([0-9a-z]*\)-\([0-9a-z]*\)-\([0-9a-z]*\)-\([0-9a-z]*\)\(.*\)ext4\(.*\)errors=remount-ro/UUID=\1-\2-\3-\4-\5\6ext4\7discard,errors=remount-ro/g" /etc/fstab &>> $logfile