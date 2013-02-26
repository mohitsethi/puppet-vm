$:.unshift(File.join(File.dirname(__FILE__),'..', "lib"))
require 'init'
require 'chef/config'
require 'vagrant'
require 'pathname'

def ui
  Chef::Config[:color] = true
  @ui || Chef::Knife::UI.new(STDOUT, STDERR, STDIN, :defaults => false)
end
