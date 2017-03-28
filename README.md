# vm_img_create
Packer scripts to create default VM Images.

# Notes

This is only a template for further development and should not be used in
a production as it is.

Post creation tasks:

* remove adminubuntu user
  * should be solved with something like: `"shutdown_command": "echo root:$(openssl rand -base64 32) | chpasswd; shutdown -P now"`
