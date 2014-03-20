class UserFactory
  attr_accessor :names, :users, :user

  def initialize(parsed_names, tweets)
    @parsed_names = parsed_names 
    @tweets = tweets
  end

  def create_users
    @users = []
    
    @parsed_names.each do |name|
      user = User.new(name, @tweets)
      @users << user
    end
    @users
    return_mutual_mentions
  end

  def return_mutual_mentions
    @users.each do |user|
      user.mutual_mentions.find_mutual_mentions
    end
    @users
  end
end