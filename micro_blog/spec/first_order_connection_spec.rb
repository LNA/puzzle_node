require 'first_order_connection'

describe FirstOrderConnection do 
  let (:first_order_connection) {FirstOrderConnection.new('data/sample_input.txt')}

  it "returns all connections for Alberta" do 
    require 'pry'
    binding.pry
  end
end