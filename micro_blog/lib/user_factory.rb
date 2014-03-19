class UserFactory
  attr_accessor :names, :users, :user

  def initialize(parsed_names, parsed_tweets = {})
    @parsed_names = parsed_names 
    @parsed_tweets = parsed_tweets
  end

  def create_users
    @users = []
    
    @parsed_names.each do |name|
      user = User.new(name, MutualMentions.new(name, @parsed_tweets))

      user.name = name
      @users << user
    end
    @users
  end
end