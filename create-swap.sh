sudo fallocate -l 8G /mnt/8GB.swap
#In case of permission issues, run the following chmod command
sudo chmod 0600 /mnt/8GB.swap
sudo mkswap /mnt/8GB.swap
sudo swapon /mnt/8GB.swap
if ! grep swap /etc/fstab > /dev/null; then \
    echo "/mnt/8GB.swap  none  swap  sw  0  0" | sudo tee -a /etc/fstab; \
fi