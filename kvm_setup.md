#!/bin/bash

### Pass Through Setup

1. Get PCI ID's to Passthrough
   1. Devices: `dmesg | grep -i -e DMAR -e IOMMU`
   2. Groups: `find /sys/kernel/iommu_groups/ -type l`
   3. Each ID: `lspci -nnk -d`
2. Add VFIO Modules to mkinit
   1. `sudo vim /etc/mkinitcpio.conf`
   2. `MODULES=(vfio_pci vfio vfio_iommu_type1 vfio_virqfd)`
3. Create vfio modprobe with the IDs from Step
   1. `sudo vim /etc/modprobe.d/vfio.conf`
   2. `options vfio-pci ids=`
4. Rebuild boot
   1. `sudo mkinitcpio -p linux-zen`
   2. Edit Grub `sudo vim /etc/default/grub`
   3. Add to grub GRUB_CMDLINE_LINUX_DEFAULT `amd_iommu=on iommu=pt`
5. Change QEMU User/Group
   1. sudo vim /etc/libvirt/qemu.conf
      ```
      user = "levi"
      group = "levi"
      ```
6. `sudo usermod -a -G kvm,libvirt levi`
7. Reboot

### HDD Get/Setup
When adding a drive to setup in libvirt, pass direct drive instead of qcow
1. `cd /dev/disk/by-id`
2. `ls -l`
3. Pass entire path Example: `/dev/disk/by-id/ata-Samsung_SSD_840_Series_S14LNEACC28579R`