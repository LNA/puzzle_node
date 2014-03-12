require 'mutual_mentions'

describe MutualMentions do 
  let (:mutual_mentions) {MutualMentions.new('data/sample_input.txt', "alberta", "bob")}

  before :each do 
    albertas_tweets = mutual_mentions.tweets_involving("alberta")
    @albertas_tweets = mutual_mentions.parse_users_tweets(albertas_tweets)
  end

  it "checks for a first level connection" do 
    mutual_mentions.users_tweeting_to_eachother?(@albertas_tweets).should == true
  end
end
