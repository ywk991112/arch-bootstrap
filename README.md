# Arch Bootstrap Script

My personal scripts for bootstrapping an archlinux system. [Installation Guide](https://leomao.github.io/2017/09/archlinux-install-note/#%E5%89%8D%E7%BD%AE%E4%BD%9C%E6%A5%AD)


NOTE: Sometimes I just updated the script without testing it,
please check it by yourself and make sure that you fully understand
the installation process before using it.

# Usage
1. Boot a computer with arch live image.
2. Prepare the partitions for installing the system.
3. Update the parameters in /etc/xdg/reflector/reflector.conf.
   See https://wiki.archlinux.org/title/Reflector#Automation
4. Make sure the internet is available and check that /etc/pacman.d/mirrorlist
   has been updated.
5. run the following command:
```console
$ curl -L https://bit.ly/arch-boostrap | tar -xz --strip-component=1
$ zsh format.sh
$ vim bootstrap.sh # set the variables and modify packages to what you need.
$ vim chroot.sh # set the variables to what you need.
$ zsh bootstrap.sh
```

Note:
https://bit.ly/arch-boostrap is the shorten URL of https://github.com/ywk991112/arch-bootstrap/archive/refs/heads/master.tar.gz

## Create Installer USB Drive
1. Insert your USB drive into your computer. Make sure the drive is not mounted.
2. Use the `lsblk` command to determine the device node assigned to your USB drive. The command should return something like `/dev/sdX` where X is the device letter.
3. Run the `dd` command to write the ISO to the USB drive. Be sure to replace `/dev/sdX` with your USB device's actual node and `path/to/archlinux.iso` with the path to the downloaded Arch Linux ISO:
    ```bash
    sudo dd bs=4M if=path/to/archlinux-2023.07.01-x86_64.iso of=/dev/sdX status=progress oflag=sync
    ```

## Manually set an IP Address
1. **Check Network Interface**: You can use the command ip link to see the available network interfaces. You should see something like enp3s0, eth0, or similar. These names represent your network interfaces.
2. **Assign IP Address**: Assign the IP address to your network interface with the following command:  
    ```bash
    ip addr add 140.112.19.242/24 dev <interface_name>
    ```
   Replace <interface_name> with your network interface name (like enp3s0 or eth0). The /24 following the IP address is the network mask, and it's a common default. This might need to be changed depending on your network.
3. **Bring up the Network Interface**: Bring the interface up if you haven't done so already:
    ```bash
    ip link set <interface_name> up
    ```
4. **Set a Default Gateway**: To access the internet, you will need to set a default gateway. This is usually the IP address of your router. You can add it with the following command:
    ```bash
    ip route add default via <gateway_ip>
    ```
   Replace <gateway_ip> with the IP address of your gateway. If you don't know this, you may need to look at your router's settings, or contact your network administrator.
5. **Set DNS Server**: Finally, you will need to specify a DNS server. Arch Linux uses a file called resolv.conf located in the /etc directory for this. You can use a text editor like nano to modify it. Here's how to add Google's DNS servers:
    ```bash
    echo "nameserver 8.8.8.8" >> /etc/resolv.conf
    echo "nameserver 8.8.4.4" >> /etc/resolv.conf
    ```
   These commands append Google's DNS servers to the end of the resolv.conf file.
6. After you've done all these steps, try pinging a website again to see if you are connected:
    ```bash
    ping -c 3 8.8.8.8
    ```
