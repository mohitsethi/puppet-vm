# -*- mode: ruby -*-
# vi: set ft=ruby :

domain = 'example.dev'

nodes = [
  { 
    :hostname => 'puppetmaster',
    :box => 'precise64',
    :box_url => "http://files.vagrantup.com/precise64.box",
    :fwd_port => {
      22 => 9022,
      8140 => 8140
    },
    :memory => 512,
    :ip => 33.33.33.10
  },
  { 
    :hostname => 'client1',
    :box => 'precise64',
    :box_url => "http://files.vagrantup.com/precise64.box",
    :fwd_port => {
      22 => 9122,
      8140 => 8140
    },
    :memory => 512,
    :ip => 33.33.33.11
  },
  { 
    :hostname => 'client2',
    :box => 'precise64',
    :box_url => "http://files.vagrantup.com/precise64.box",
    :fwd_port => {
      22 => 9222,
      8140 => 8140
    },
    :memory => 512,
    :ip => 33.33.33.12
  },
]

Vagrant::Config.run do |config|
  nodes.each do |node|
    config.vm.define node[:hostname] do |node_config|
      node_config.vm.box = node[:box]
      node_config.vm.box_url = node[:box_url]
      node_config.vm.host_name = node[:hostname] + '.' + domain
      node_config.vm.network :hostonly, node[:ip]

      node[:fwd_port].each_pair do |guest_port, host_port|
        node_config.vm.forward_port guest_port, host_port, :auto => true
      end

      memory = node[:memory] ? node[:memory] : 256;
      node_config.vm.customize [
        'modifyvm', :id,
        '--name', node[:hostname],
        '--memory', memory.to_s
      ]

      node_config.vm.provision :puppet do |puppet|
        puppet.manifests_path = 'provision/manifests'
        puppet.module_path = 'provision/modules'
      end
    end
  end
end
