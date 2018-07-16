Moodle Vagrant
==============
## About
Development VM with shared HTML root directory.
Includes:
 * PHP(with xdebug)
 * NGINX
 * PostgreSQL
 * Redis
 * Selenium

## Install
### Linux
Requirements:
 * libvirt
 * kvm
 * NFS
 * vagrant
 * vagrant-hostmanager

#### Ubuntu
Install the following packages in addition to vagrant requirements:
 * nfs-kernel-server
 * firewalld

#### All
Steps:
 1. (Insert distro specific stuff here)
 2. Add the appropriate vagrant-syncedfolders file to /etc/sudo.d/ for your distro
 3. Run additional_files/firewall.sh as root
 4. Replace nfs_client.rb in plugins/guests/redhat/cap/nfs_client.rb
 5. vagrant up
 
### Windows
Requirements:
 * Virtualbox
 * vagrant
 * vagrant-hostmanager
 * babun (optional-recommended)

Steps:
 1. Install in the following order: Virtualbox, vagrant, babun.
 2. Run babun as administrator and install the hostmanager plugin (install instructions in their github repo's)
 3. vagrant up
