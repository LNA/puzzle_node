parser = Parser.new('data/sample_input.txt')
names = parser.parse_names
tweets = parser.parse_tweets

users = CreateUsers.new(names) 

create_tweets = CreateTweets.new(tweets) 
user = User.new(name)
user.users_tweeted_to
user.received_tweets_from

mutual_mentions = user.mutual_mentions

connection_factory = ConnectionFactory.new(user, mutual_mentions)