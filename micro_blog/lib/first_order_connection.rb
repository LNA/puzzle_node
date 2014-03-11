$: << File.expand_path(File.dirname(__FILE__) + "/../data/")

class FirstOrderConnection
  attr_accessor :file, :relevant_tweets

  def initialize(file)
    @file = file 
  end

  def tweets_involving(user)
    @file = File.readlines(@file)
    r = Regexp.new user
    @relevant_tweets = file.grep(r) 
  end

  def mutual_mentions_between(first_user, second_user)
    individual_connections = []
    r = Regexp.new second_user
    
    mutual_tweets = @relevant_tweets.grep(r)
    split =  mutual_tweets.map {|word| word.split(' ')}
    split.each do |tweet|
      individual_connections << tweet.grep(r)*","
    end

    if individual_connections.include?(second_user + ":") && individual_connections.include?("@" + second_user)
      true
    else
      false
    end
  end
end