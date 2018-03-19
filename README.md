Moodle Vagrant
==============
## About
Development VM with shared HTML root directory.
Includes:
 * PHP(with xdebug)
 * NGINX
 * PostgreSQL
 * Redis

## Install
### Linux
Requirements:
 * libvirt
 * kvm
 * vagrant
 * vagrant-hostmanager

Steps:
 1. (Insert distro specific stuff here)
 2. vagrant up
 
### Windows
Requirements:
 * Virtualbox
 * vagrant
 * vagrant-hostmanager
 * vagrant-vbguest
 * babun (optional-recommended)

Steps:
 1. Install in the following order: Virtualbox, vagrant, babun.
 2. Run babun as administrator and install the hostmanager and vbguest plugins (install instructions in their github repo's)
 3. vagrant up
