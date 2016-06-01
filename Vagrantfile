# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "compose" do |compose|
    compose.vm.box="geerlingguy/ubuntu1404"
    compose.vm.box_version = "1.1.0"

    compose.vm.provider "virtualbox" do |v|
      v.memory = 512
    end

    compose.vm.network "private_network", ip:"10.0.32.5"
    compose.vm.provision :shell do |sh|
      sh.inline = <<-EOF
        if [ ! -f /var/lock/provision.lock ]; then
          apt-get update --assume-yes
          apt-get install nodejs --assume-yes
          apt-get install gnupg2 --assume-yes
          gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
          curl -sSL https://get.rvm.io | bash -s stable --ruby=2.0.0 --gems=bundler
          source /usr/local/rvm/scripts/rvm
          rvm use 2.0.0 --default

          gem install bundler
          mkdir -p /etc/platform-ws-frontend
          cat > /etc/platform-ws-frontend/launch.sh <<EOL
#!/bin/bash
source /usr/local/rvm/scripts/rvm
while [ ! -f /vagrant/bin/rails ]
do
  sleep 1
done
cd /vagrant
source ./setup-env.sh
ruby ./bin/rails server --binding=0.0.0.0
EOL

          chmod +x /etc/platform-ws-frontend/launch.sh

          cat > /etc/init/platform-ws-frontend.conf <<EOL
# platform-ws-frontend
description "platform-ws-frontend daemon"
author "Compose.io"

# Listen and start after the vagrant-mounted event
start on net-device-up IFACE=eth1 and runlevel [2345]
stop on runlevel [!2345]

script
  /etc/platform-ws-frontend/launch.sh 2>&1 tee -a /var/log/platform-ws-frontend.log /vagrant/platform-ws-frontend.log
end script
EOL
          initctl reload-configuration
          touch /var/lock/provision.lock
        fi
        cd /vagrant
        source /usr/local/rvm/scripts/rvm
        rvm use 2.0.0 --default
        bundle install
        service platform-ws-frontend restart
      EOF
    end
  end
end
