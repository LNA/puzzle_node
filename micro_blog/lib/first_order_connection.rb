$: << File.expand_path(File.dirname(__FILE__) + "/../data/")

class FirstOrderConnection
  attr_accessor :file, :relevant_tweets

  def initialize(file)
    @file = file 
    @relevant_tweets = []
  end

  def tweets_involving(user)
    file = File.readlines(@file)
    @user_check = Regexp.new user
    @relevant_tweets = file.grep(@user_check) 
  end

  def mutual_mentions_between(first_user, second_user)
    @handle_mentions = []
    @second_user_grep = Regexp.new second_user
    @second_user = second_user

    mutual_tweets

    first_order_connection?
  end
private 

def mutual_tweets
  mutual_tweets = @relevant_tweets.grep(@second_user_grep).map {|word| word.split(' ')}  
    mutual_tweets.each do |tweet|
      @handle_mentions << tweet.grep(@second_user_grep)*","
    end
  end
end

def first_order_connection?
  if @handle_mentions.include?(@second_user + ":") && @handle_mentions.include?("@" + @second_user)
    true
  else
    false
  end
end