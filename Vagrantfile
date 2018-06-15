servername = File.basename(Dir.getwd)
fullname = "#{servername}.localdomain"

Vagrant.configure("2") do |config|
  config.vm.box = "fedora/28-cloud-base"

  Vagrant::Config.run do |config|
    config.vbguest.auto_update = true
    config.vbguest.no_remote = true
  end
  
  config.vm.provider "libvirt" do |lv, override|
    lv.cpus = 4
    lv.memory = 4096
    override.vm.synced_folder './', '/vagrant', type: 'sshfs'
  end
  config.vm.provider "virtualbox" do |vb, override|
    vb.cpus = 4
    vb.memory = 4096
    override.vm.network "private_network", type: "dhcp"
    override.hostmanager.ip_resolver = proc do |vm, resolving_vm|
      # in virtualbox 0 is nat network
      vm.provider.driver.read_guest_ip(1)
    end
    override.vm.synced_folder './', '/vagrant', type: 'virtualbox'
  end
  
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = false
  config.vm.define "#{servername}" do |node|
    node.hostmanager.aliases = ["#{fullname}", "saml.#{fullname}", "behat.#{fullname}"]
  end
  
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.extra_vars = {
      servername: "#{fullname}"
    }
  end
end
