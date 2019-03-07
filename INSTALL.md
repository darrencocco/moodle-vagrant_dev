Moodle Vagrant
==============
## Install
### Linux
#### Install OS specific packages
##### Fedora 29
Install packages for virtualisation and compiling vagrant addons
```
$ sudo dnf install libvirt libvirt-devel libvirt-daemon-kvm \
                   '@C Development Tools and Libraries'
```
Add user to libvirt group to give them acces to run VMs
```
$ sudo usermod -aG libvirt {your_username}
```

##### Ubuntu 18.04
Install packages
```
$ sudo apt install libvirt-clients libvirt-daemon libvirt-dev \
                   virt-manager nfs-kernel-server
```
Add user to libvirt group to give them acces to run VMs
```
$ sudo usermod -aG libvirt {your_username}
```

#### Install Vagrant and plugins
Download the appropriate package for your OS (Ubuntu/Debian) or (Fedora/CentOS).
https://www.vagrantup.com/downloads.html

Then install the packages depending on your OS's package management methodology.

Install plugins (do not run with sudo, run as the user you intend to use vagrant with)
```
$ vagrant plugin install vagrant-libvirt
$ vagrant plugin install vagrant-hostmanager
```
#### Post-install configuration
1. Add the appropriate vagrant-syncedfolders file to /etc/sudoers.d/ for your distro
2. Add the appropriate vagrant-hostmanager file to /etc/sudoers.d/ for your distro
   **(please note this one needs customisation, please replace <home folder> in the
   file with the home folder of your user)**
3. Run additional_files/firewall.sh as root (optional, only if using firewalld)
4. (deprecated) Replace nfs_client.rb in plugins/guests/redhat/cap/nfs_client.rb

### Windows (untested)
#### Base Applications
Install
 * VirtualBox
 * Vagrant
 
#### Vagrant plugins
In PowerShell:
```
$ vagrant plugin install vagrant-hostmanager
```

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
### vagrant-libvirt
#### Install
There is a depedency path issue with the vagrant embedded ruby not detecting
the correct location of the libvirt development files.
Run the plugin install with the alternative command listed below.
```
$ CONFIGURE_ARGS='with-ldflags=-L/opt/vagrant/embedded/lib with-libvirt-include=/usr/include/libvirt with-libvirt-lib=/usr/lib' vagrant plugin install vagrant-libvirt
```
