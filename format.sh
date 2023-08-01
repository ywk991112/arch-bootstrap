# EFI system partition
mkfs.fat -F32 /dev/nvme0n1p1
# swap
mkswap /dev/nvme0n1p2
# root partition
mkfs.ext4 /dev/sda2
# home partition
mkfs.ext4 /dev/nvme0n1p3
