
$common = <<SCRIPT

echo "* Add hosts ..."
echo "192.168.100.103 pipelines.prd pipelines" >> /etc/hosts

SCRIPT

Vagrant.configure(2) do |config|
    
  config.ssh.insert_key = false

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end

  config.vm.define "pipelines" do |pipelines|
    pipelines.vm.box = "merev/debian-11"
    pipelines.vm.box_version = "1"
    pipelines.vm.hostname = "pipelines.prd"
    pipelines.vm.network "private_network", ip: "192.168.100.103"
    pipelines.vm.synced_folder "vagrant/", "/vagrant"
    pipelines.vm.provision "shell", inline: $common
    pipelines.vm.provision "shell", path: "jenkins-setup.sh"
  end

end
