Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.box_check_update = false
  config.vm.hostname = "dev"
  config.vm.boot_timeout = 600
  # internet
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  # node debugging with VS Code
  config.vm.network "forwarded_port", host: 5858, guest: 5858
  # mysql
  # config.vm.network "forwarded_port", guest: 3306, host: 3306
  # server
  config.vm.network "forwarded_port", guest: 3000, host: 4567
  config.vm.synced_folder "../shack", "/home/ubuntu/shack"
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "3072"
  end
  config.vm.provision "file", source: "./env-vars.sh", destination: "env-vars.sh"
  config.vm.provision "file", source: "./shack.sql", destination: "shack.sql"
  config.vm.provision "file", source: "./shack.service", destination: "shack.service"
  config.vm.provision "file", source: "./start.sh", destination: "start.sh"
  config.vm.provision "shell", path: "bootstrap.sh"
  config.vm.provision "shell", path: "up.sh", run: "always"
end
