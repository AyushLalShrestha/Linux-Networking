<!-- Creating LVMs -->

  - pvscan <!-- Physical Volume scan -->
  - vgscan <!-- Volume group scan -->
  - lvscan <!-- Logical Volume scan -->

  - pvcreate /dev/sdb10, pvcreate /dev/sdb11, pvcreate /dev/sdb12   

  - vgcreate vg1 /dev/sdb10 /dev/sdb11
  - vgs

  - lvcreate -n lv1 -L 100G vg1
  - lvscan 

  - mkfs.xfs /dev/vg1/lv1
  - mkdir /lvm

  - vi /etc/fstab
    - add : /dev/vg1/lv1 /lvm xfs defaults 0 0 
  - mount -a

  - find /usr/share/doc -name '*.pdf' -exex cp {} /lvm/ \;
  - ls /lvm

<!-- Extend a Volume Group -->
  - df -h /lvm
  - vgextend vg1 /dev/sdb12
  - vgs 

<!-- Extend a Logical Volume -->
  - lvextend -L +50m /dev/vg1/lv1
  - xfs_growfs /lvm
  - df -h /lvm


<!-- Take LVM Snapshots -->
  - lvcreate -L 30m -s -n backup /dev/vg1/lv1
  - mount /dev/bg1/backup /mnt -o nouuid,ro
  - tar -cf /root/backup.tar /mnt
  - umount /mnt
  - lvremove /dev/vg1/backup


<!-- Shred and Encrypt -->
  - shred -v --iterations=1 /dev/vg1/enc
  - grep -i ACL /boot/config-$(uname -r)
  - grep -i DM_CRYPT /boot/config-$(uname -r)
  - lsmod | grep dm_crypt
  - modprobe dm_crypt 
  - lsmod | grep dm_crypt
  - rpm -qf $(which cryptsetup)
  - yum update cryptsetup
  
  - cryptsetup -y luksFormat /dev/vg1/enc
  - cryptsetup luksDump /dev/vg1/enc
  - cryptsetup isLuks /dev/vg1/enc
  - echo $?
  - cryptsetup isLuks /dev/vg1/lv1
  - echo $?

  - cryptsetup luksOpen /dev/vg1/enc enc_vol <!-- Then enter the passphrase -->
  - ls /dev/mapper
  - mkfs.xfs /dev/mapper/enc_vol
  



<!-- 

FEDORA FILE STRUCTURE:

NAME                            MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda                               8:0    0 465.8G  0 disk
|-sda1                            8:1    0   200M  0 part /boot/efi
|-sda2                            8:2    0     1G  0 part /boot
`-sda3                            8:3    0 464.6G  0 part
  |-fedora_localhost--live-root 253:0    0    50G  0 lvm  /
  |-fedora_localhost--live-swap 253:1    0   3.9G  0 lvm  [SWAP]
  `-fedora_localhost--live-home 253:2    0 410.7G  0 lvm  /home
sr0                              11:0    1  1024M  0 rom

-->


