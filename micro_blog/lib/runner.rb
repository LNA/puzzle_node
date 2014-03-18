parser = Parser.new('data/sample_input.txt')
names = parser.parse_names
tweets = parser.parse_tweets

users = CreateUsers.new(names) 

create_tweets = CreateTweets.new(tweets) 
user = User.new(name)
user.users_tweeted_to
user.received_tweets_from

user_first_level_connections = user.user_first_level_connections