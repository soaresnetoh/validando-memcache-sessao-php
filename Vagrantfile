# -*- mode: ruby -*-
# vi: set ft=ruby  :

machines = {
  "memcache1"   => {"memory" => "1024", "cpu" => "1", "ip" => "61", "image" => "bento/ubuntu-20.04"},
  "memcache2"   => {"memory" => "1024", "cpu" => "1", "ip" => "62", "image" => "bento/ubuntu-20.04"},
  "memcache3"   => {"memory" => "1024", "cpu" => "1", "ip" => "63", "image" => "bento/ubuntu-20.04"},
}

Vagrant.configure("2") do |config|

  config.vm.box_check_update = false
  machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|
      machine.vm.box = "#{conf["image"]}"
      machine.vm.network "private_network", ip: "10.61.11.#{conf["ip"]}"
      machine.vm.network "public_network", ip: "192.168.0.#{conf["ip"]}", bridge: "eno1"
      machine.vm.provider "virtualbox" do |vb|
        vb.name = "#{name}"
        vb.memory = conf["memory"]
        vb.cpus = conf["cpu"]
        vb.customize ["modifyvm", :id, "--groups", "/memcache"]
      end
      machine.vm.synced_folder ".", "/vagrant"

      if "#{name}" == "memcache1"
        machine.vm.provision "shell", 
          inline: <<-SHELL
            sudo apt update
            
            sudo apt install -y apache2
            sudo apt install -y software-properties-common ca-certificates lsb-release apt-transport-https
            sudo LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php -y
            sudo apt-get install -y php5.6 libapache2-mod-php5.6 php5.6-mcrypt
            sudo apt-get install -y php5.6-memcache memcached

            sudo sed -i "s/-l 127.0.0.1/-l 10.61.11.#{conf["ip"]}/g" /etc/memcached.conf
            sudo service memcached restart
            sudo sed -i '/session.save_handler =/d' /etc/php/5.6/apache2/php.ini
            sudo sed -i '/session.save_handler =/d' /etc/php/5.6/apache2/php.ini
            echo -e "session.save_handler = memcache" | sudo tee -a /etc/php/5.6/apache2/php.ini
            echo -e "session.save_path = 'tcp://10.61.11.61:11211,tcp://10.61.11.62:11211,tcp://10.61.11.63:11211'" | sudo tee -a /etc/php/5.6/apache2/php.ini

            echo -e "memcache.allow_failover=1\nmemcache.session_redundancy=4" | sudo tee -a /etc/php/5.6/mods-available/memcache.ini
            sudo service apache2 reload
            sudo cp /vagrant/session.php /var/www/html/
          SHELL
      end
      
      if "#{name}" == "memcache2"
        machine.vm.provision "shell", 
          inline: <<-SHELL
            sudo apt update
            
            sudo apt install -y apache2
            sudo apt install -y software-properties-common ca-certificates lsb-release apt-transport-https
            sudo LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php -y
            sudo apt-get install -y php5.6 libapache2-mod-php5.6 php5.6-mcrypt
            sudo apt-get install -y php5.6-memcache memcached

            sudo sed -i "s/-l 127.0.0.1/-l 10.61.11.#{conf["ip"]}/g" /etc/memcached.conf
            sudo service memcached restart
            sudo sed -i '/session.save_handler =/d' /etc/php/5.6/apache2/php.ini
            sudo sed -i '/session.save_handler =/d' /etc/php/5.6/apache2/php.ini
            echo -e "session.save_handler = memcache" | sudo tee -a /etc/php/5.6/apache2/php.ini
            echo -e "session.save_path = 'tcp://10.61.11.61:11211,tcp://10.61.11.62:11211,tcp://10.61.11.63:11211'" | sudo tee -a /etc/php/5.6/apache2/php.ini

            echo -e "memcache.allow_failover=1\nmemcache.session_redundancy=4" | sudo tee -a /etc/php/5.6/mods-available/memcache.ini
            sudo service apache2 reload
            sudo cp /vagrant/session.php /var/www/html/
          SHELL
      end

      if "#{name}" == "memcache3"
        machine.vm.provision "shell", 
          inline: <<-SHELL
            sudo apt update
            
            sudo apt install -y apache2
            sudo apt install -y software-properties-common ca-certificates lsb-release apt-transport-https
            sudo LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php -y
            sudo apt-get install -y php5.6 libapache2-mod-php5.6 php5.6-mcrypt
            sudo apt-get install -y php5.6-memcache memcached

            sudo sed -i "s/-l 127.0.0.1/-l 10.61.11.#{conf["ip"]}/g" /etc/memcached.conf
            sudo service memcached restart
            sudo sed -i '/session.save_handler =/d' /etc/php/5.6/apache2/php.ini
            sudo sed -i '/session.save_handler =/d' /etc/php/5.6/apache2/php.ini
            echo -e "session.save_handler = memcache" | sudo tee -a /etc/php/5.6/apache2/php.ini
            echo -e "session.save_path = 'tcp://10.61.11.61:11211,tcp://10.61.11.62:11211,tcp://10.61.11.63:11211'" | sudo tee -a /etc/php/5.6/apache2/php.ini

            echo -e "memcache.allow_failover=1\nmemcache.session_redundancy=4" | sudo tee -a /etc/php/5.6/mods-available/memcache.ini
            sudo service apache2 reload
            sudo cp /vagrant/session.php /var/www/html/
          SHELL
      end




    end
  end
end
