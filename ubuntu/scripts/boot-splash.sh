#!/bin/bash

# disable boot splash and get some output on boot
sed -i 's/quiet//g' /boot/grub/grub.cfg /etc/default/grub
sed -i 's/splash//g' /boot/grub/grub.cfg /etc/default/grub
update-grub

