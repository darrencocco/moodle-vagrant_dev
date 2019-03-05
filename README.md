Moodle Vagrant
==============
## About
Development VM with shared HTML root directory.
Includes:
 * PHP(with xdebug)
 * NGINX
 * PostgreSQL (accessible through port 5432 from host)
 * Selenium + Firefox
 * MailCatcher (http://mail.$foldername.localdomain)
 * SimpleSAML (http://saml.$foldername.localdomain)

## Install
### Linux
#### Install OS specific packages
##### Fedora 29
Run the following commands
```
# Install packages
$ sudo dnf install
```


##### Ubuntu 18.04
Run the following commands:
```
# Install packages
$ sudo apt install
```

#### Install Vagrant and plugins
#### Post-install configuration
1. Add the appropriate vagrant-syncedfolders file to /etc/sudoers.d/ for your distro
2. Add the appropriate vagrant-hostmanager file to /etc/sudoers.d/ for your distro
   **(please note this one needs customisation, please replace <home folder> in the
   file with the home folder of your user)**
3. Run additional_files/firewall.sh as root
4. (deprecated) Replace nfs_client.rb in plugins/guests/redhat/cap/nfs_client.rb

### Windows (not recommended)
TBD
Requirements:
 * Virtualbox
 * vagrant
 * vagrant-hostmanager
 * babun (optional-recommended)

Steps:
 1. Install in the following order: Virtualbox, vagrant, babun.
 2. Run babun as administrator and install the hostmanager plugin (install instructions in their github repo's)
 3. vagrant up

## Running
Run `vagrant up` in the folder you placed the this repo into.
Please note that the url that the VM is accessible from is at
$foldername.localdomain where of course the folder name is
the one that cloned this repo into. (which means you can run
multiple guests at different URLs at the same time)

## Known Issues
### SELinux
There is a current issue with SELinux, Ansible and NFS that causes
the provisioning script to fail on first run. This can be fixed by
restarting the Vagrant guest. Then just run `vagrant provision`
again to restart the provisioning step.
```
$ vagrant halt
$ vagrant up
$ vagrant provision
```
