require 'user'

describe User do 
  let (:user) {User.new("alberta")}

  it "has a name" do 
    user.name.should == "alberta"
  end
end