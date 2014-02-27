require 'bankers_rounding.rb'

describe "BankersRounding" do 

  context '#is_a_floating_point_number' do

    it "returns true for 1.5" do 
      bankers_rounding = BankersRounding.new(1.5)

      bankers_rounding.is_a_floating_point_number?.should == true
    end

    it "returns false for 2" do
      bankers_rounding = BankersRounding.new(2)

      bankers_rounding.is_a_floating_point_number?.should == false
    end
  end
end
