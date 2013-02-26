$:.unshift(File.join(File.dirname(__FILE__),'..', "lib"))
require 'rubygems'
require 'bundler/setup'
require 'chef/knife/core/ui'

Dir["tasks/*.rake"].each { |t| load t }

desc "Starts the environment"
task :start do 
  puts "=== In Start... "
  puts "project_root: #{Base.project_root}"
end

desc "Fetches the status for environment"
task :status do
  env = Vagrant::Environment.new(:cwd => Base.project_root)
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