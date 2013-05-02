#!/bin/bash -x
DISKS=$(udisks --enumerate-device-files | xargs -n 1 readlink -f | sort | uniq)
for DISK in $DISKS;
do
  sudo udisks --mount $DISK &
done
