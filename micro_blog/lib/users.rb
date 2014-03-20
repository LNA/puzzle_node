class Users 
  def create(users)
    @users = []
    
    users.each do |name|
      user = User.new(name)
      @users << user
    end
    @users
  end
end