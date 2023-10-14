# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.define "master" do |master|
  master.vm.box = "ubuntu/focal64"
  master.vm.hostname = "master.example.com"
  master.vm.network "private_network", ip: "192.168.33.35"
  end
  config.vm.define "slave" do|slave|
  slave.vm.box = "ubuntu/focal64"
  slave.vm.hostname = "slave.example.com"
  slave.vm.network "private_network", ip: "192.168.33.20"
  end
  
  # Create apache web-server
   config.vm.define "apache", primary:true do |apache|
   apache.vm.network "private_network", ip: "192.168.33.25" 
   apache.vm.network "forwarded_port", guest: 80, host:8080, id:"apache2"
   apache.vm.provision "shell", inline: <<-SHELL
           sudo apt-get install -y apache2
           sudo systemct1 enable apache2
           sudo service apache2 start
   SHELL
   end
  
  #create mysql server
   config.vm.define "data" do |data|
   data.vm.network "private_network", ip: "192.168.33.40"
   data.vm.provision "shell", inline: <<-SHELL
   sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password pass'
   sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password pass'
        sudo apt-get install -y mysql-server
        sudo systemctl enable mysql
   SHELL
   end

  #create php server
   config.vm.define "php" do |php|
   php.vm.network "private_network", ip:"192.168.33.41"
   php.vm.provision "shell", inline: <<-SHELL
        sudo apt install -y php php-mysql libapache2-mod-php
   SHELL
   end
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at  
  # https://docs.vagrantup.com.
  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "base"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Disable the default share of the current code directory. Doing this
  # provides improved isolation between the vagrant box and your host
  # by making sure your Vagrantfile isn't accessable to the vagrant box.
  # If you use this you may want to enable additional shared subfolders as
  # shown above.
  # config.vm.synced_folder ".", "/vagrant", disabled: true

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
