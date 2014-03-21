require 'user_connections'
require 'mutual_mentions_finder'
require 'parser'
require 'runner'
require 'tweet'
require 'tweet_factory'
require 'user'
require 'users'

class Runner
  parser = Parser.new('data/complete_input.txt')
  names = parser.parse_names
  parsed_tweets = parser.parse_tweets

  users = names.map { |name| User.new(name)}

  tweet_factory = TweetFactory.new
  tweets = parsed_tweets.map { |parsed_tweet| tweet_factory.create(parsed_tweet)}

  mutual_mentions = MutualMentionsFinder.new(tweets)
  user_connections = UserConnections.new(users, mutual_mentions)
  user_connections.first_level_connections
  user_connections.add_connection_level
end