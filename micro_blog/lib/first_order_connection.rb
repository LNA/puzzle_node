$: << File.expand_path(File.dirname(__FILE__) + "/../data/")

class FirstOrderConnection
  def initialize(file)
    @file = file 
  end
end