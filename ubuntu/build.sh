#!/bin/bash

# get infromations
read -p 'Enter Username:' userName
read -p 'Enter password: ' -s password

imageDir=/images
indisk="output-ubuntu-14.04.5-server-amd64/packer-ubuntu-14.04.5-server-amd64"
outdisk="output-ubuntu-14.04.5-server-amd64/packer-ubuntu-14.04.5-server-amd64.img"

indisk2="output-ubuntu-16.04.1-server-amd64/packer-ubuntu-16.04.1-server-amd64"
outdisk2="output-ubuntu-16.04.1-server-amd64/packer-ubuntu-16.04.1-server-amd64.img"

# build the image
packer.io build -var "user=${Username}" -var "password=${password}" ubuntu-14.04.5-server-amd64.json
packer.io build -var "user=${Username}" -var "password=${password}" ubuntu-16.04.1-server-amd64.json

# cleaning the img
virt-sysprep -a ${indisk} --firstboot-command 'dpkg-reconfigure openssh-server'
virt-sysprep -a ${indisk2} --firstboot-command 'dpkg-reconfigure openssh-server'

# move and compress the image
virt-sparsify ${indisk} ${outdisk}  --compress --check-tmpdir=ignore
virt-sparsify ${indisk2} ${outdisk2}  --compress --check-tmpdir=ignore

# removing old img
# rm output-ubuntu-14.04.5-server-amd64/packer-ubuntu-14.04.5-server-amd64

