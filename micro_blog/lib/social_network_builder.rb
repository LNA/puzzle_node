$: << File.expand_path(File.dirname(__FILE__))
require 'mutual_mentions_finder'
require 'parser'
require 'tweet'
require 'tweet_factory'
require 'user'
require 'users'
require 'user_connections'

class SocialNetworkBuilder
  def run
  parser = Parser.new('data/complete_input.txt')
  names = parser.parse_names
  parsed_tweets = parser.parse_tweets

  users = names.map { |name| User.new(name)}

  tweet_factory = TweetFactory.new
  tweets = parsed_tweets.map { |parsed_tweet| tweet_factory.create(parsed_tweet)}

  mutual_mentions = MutualMentionsFinder.new(tweets)
  user_connections = UserConnections.new(users, mutual_mentions)
  user_connections.first_level_connections
  puts user_connections.find_connection_level
  end
end
builder = SocialNetworkBuilder.new
builder.run