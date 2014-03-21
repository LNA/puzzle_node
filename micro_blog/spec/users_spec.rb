require 'user'
require 'users'

describe Users do 
  let (:test_users) { ["ava", "bob"] }
  
  it "creates users" do 
    users = Users.new

    users.create(test_users).count.should == 2
  end
end