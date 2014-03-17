parser = Parser.new('data/sample_input.txt')
names = parser.parse_names
tweets = parser.parse_tweets

users = CreateUsers.new(names) #creates user objects so I can call user.name

create_tweets = CreateTweets.new(tweets) #creates tweet objects so I can call tweet.sender and tweet.receiver
user = User.new(name)