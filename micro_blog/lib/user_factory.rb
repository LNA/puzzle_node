class UserFactory
  attr_accessor :names, :users, :user

  def initialize(parsed_names, tweets)
    @parsed_names = parsed_names 
    @tweets = tweets
  end

  def create_users
    @users = []
    
    @parsed_names.each do |name|
      user = User.new(name, MutualMentions.new(name, @tweets))

      user.name = name
      @users << user
    end
    @users
  end
end