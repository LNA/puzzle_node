class MutualMentions
  attr_accessor :file, :first_user, :second_user

  def initialize(file, first_user, second_user)
    @file = file 
    @first_user = first_user
    @second_user = second_user
  end

  def tweets_involving(user)
    file = File.readlines(@file)
    current_user = Regexp.new user
    @tweets_involving_user = file.grep(current_user)
  end

  def parse_users_tweets(tweets_involving_user)
    tweets_string = tweets_involving_user*","
    @tweets = tweets_string.split(' ')
  end

  def users_tweeting_to_eachother?
    @tweets.include?("," + @second_user + ":") && @tweets.include?("@" + @first_user)
  end
end