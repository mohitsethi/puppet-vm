$:.unshift(File.join(File.dirname(__FILE__),'..', "lib"))
require 'rubygems'
require 'bundler/setup'
require 'chef/knife/core/ui'

Dir["tasks/*.rake"].each { |t| load t }

desc "Starts the environment"
task :start do 
  environment = Vagrant::Environment.new(:ui_class => Vagrant::UI::Colored, :cwd => Base.project_root)
  environment.cli('up')
end

desc "Fetches the status for environment"
task :status do
  env = Vagrant::Environment.new(:ui_class => Vagrant::UI::Colored, :cwd => Base.project_root)
  env.vms.values.each do |vm|
    state = vm.state
    status_string = "#{vm.name}: "
    case state
    when :running
      status_string << ui.color(state.to_s.upcase, :green, :bold)
    when :stopped
      status_string << ui.color(state.to_s.upcase, :red, :bold)
    else
      status_string << ui.color(state.to_s.gsub(/_/, ' ').upcase, :yellow, :bold)
    end
    puts status_string
  end
end

desc "Stops the environment"
task :stop do
  environment = Vagrant::Environment.new(:ui_class => Vagrant::UI::Colored, :cwd => Base.project_root)
  environment.cli('halt')
end

desc "Destroys the environment"
task :destroy do
  environment = Vagrant::Environment.new(:ui_class => Vagrant::UI::Colored, :cwd => Base.project_root)
  environment.cli('destroy', '-f')
end