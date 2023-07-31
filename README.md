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
$ vim bootstrap.sh # set the variables and modify packages to what you need.
$ vim chroot.sh # set the variables to what you need.
$ zsh bootstrap.sh
```

Note:
https://bit.ly/arch-boostrap is the shorten URL of https://github.com/ywk991112/arch-bootstrap/archive/refs/heads/master.tar.gz
