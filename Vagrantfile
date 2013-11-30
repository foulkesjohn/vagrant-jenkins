Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.define "jenkins-master" do |c|
    c.vm.hostname = "jenkins-master.example.com"
    c.vm.network "private_network", ip: "192.168.60.2"

    c.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file = "site.pp"
      puppet.module_path = "modules"
    end
  end

  config.vm.define "jenkins-slave01" do |c|
    c.vm.hostname = "jenkins-slave01.example.com"
    c.vm.network "private_network", ip: "192.168.60.3"

    c.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file = "site.pp"
      puppet.module_path = "modules"
    end
  end

  config.vm.define "jenkins-slave02" do |c|
    c.vm.hostname = "jenkins-slave02.example.com"
    c.vm.network "private_network", ip: "192.168.60.4"

    c.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file = "site.pp"
      puppet.module_path = "modules"
    end
  end
end
