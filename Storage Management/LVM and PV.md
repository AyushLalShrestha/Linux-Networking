<!-- Creating a LVM -->
1. Physical Volume scan: pvscan
   Volume group scan: vgscan
   Logical Volume scan: lvscan

2. pvcreate /dev/sdb10, pvcreate /dev/sdb11, pvcreate /dev/sdb12   

3. vgcreate vg1 /dev/sdb10 /dev/sdb11
   vgscan or vgs

4. lvcreate -n lv1 -L 184m vg1
   lvscan 

5. mkfs.xfs /dev/vg1/lv1
6. mkdir /lvm

7. vi /etc/fstab
   - add : /dev/vg1/lv1 /lvm xfs defaults 0 0 
   - mount -a

8. find /usr/share/doc -name '*.pdf' -exex cp {} /lvm/ \;
   - ls /lvm

9. df -h /lvm
10. vgextend vg1 /dev/sdb12
   - vgs 

11. lvextend -L +50m /dev/vg1/lv1
   - xfs+growfs /lvm
   - df -h /lvm



