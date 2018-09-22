<!-- Working with partitions -->
1. lsblk   <!-- For mac OS --> diskutil list
   
2. fdisk -l /dev/sdb

3. <!-- To create a new partition  -->
    - fdisk /dev/sdb
    - press: m to see the menu

4. dd if=/dev/zero of=/dev/sdb count=1 bs=512

<!-- Make a filesystem(ext4) in the created partition -->
5. mkfs.ext4 -L DATA /dev/sdb6 

6. tune2fs -L MYDATA -c 0 -i 0 /dev/sdb6

7. dumpe2fs /dev/sdb6
    - dumpe2fs /dev/sdb6 | less

8. <!-- Make xfs file system  -->
    - mkfs.xfs -b size=1k -1 size=10m /dev/sdb7
    - xfs_ //Do double tab
    - xfs_db -x /dev/sdb7
    > help
    > uuid
    > label

9. <!-- Now, Mounting the file systems to a folder we have created above-->
    - mount /dev/sdb6 /mnt
    - ls /mnt
    - umount /mnt
    - mkdir -p /data/{mydata,data2}
    - ls /data

    - mount /dev/sdb6 /data/mydata
    - mount | grep mydata
    - mount -o remount,noexec /dev/sdb6 /data/mydata

    - umount /data/mydata

<!-- To mount these partitions when the system starts -->
    - blkid /dev/sdb6
    - edit: /etc/fstab
        - add: UUID="UUID_from_step_10" /data/mydata ext4 noexec 0 2ß
    - then mount -a    

