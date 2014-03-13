require 'tweet_parser'

describe TweetParser do 
  let (:tweet_parser) {ConnectionFinder.new('data/sample_input.txt')}

  before :each do 
    @users = tweet_parser.parse_file_down_to_individual_words
  end

  it "finds users" do 
    tweet_parser.parse_users.should == ["@alberta", "@bob", "@christie", "@duncan", "@emily", "@farid"]
  end
end