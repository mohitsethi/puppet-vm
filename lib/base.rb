require 'init'

module Base

  def self.source_root
    @source_root ||= Pathname.new(File.expand_path("../../", __FILE__))
  end

  def self.project_root 
    source_root
  end

  def self.lib_root
    Pathname.new(File.join(project_root, 'lib'))
  end
end