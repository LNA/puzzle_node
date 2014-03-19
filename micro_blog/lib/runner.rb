parser = Parser.new('data/sample_input.txt')
names = parser.parse_names
tweets = parser.parse_tweets

users = UserFactory.new(names) 

tweets = TweetFactory.new(tweets) 
mutual_mentions = MutualMentions.new("ava", tweets )

connection_factory = ConnectionFactory.new(user, mutual_mentions)