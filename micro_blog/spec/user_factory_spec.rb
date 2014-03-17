require 'user_factory'

describe UserFactory do 
  it "creates user" do 
    test_data = ["@alberta", "@bob", "@christie", "@duncan", "@emily", "@farid"]
    user_factory = UserFactory.new(test_data)

    user_factory.create_users.count.should == 6
  end
end