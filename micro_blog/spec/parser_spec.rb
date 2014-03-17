require 'parser'

describe Parser do 
  let (:tweet_parser) {Parser.new('data/sample_input.txt')}

  it "parses a file" do 
    tweet_parser.parse_tweets.count.should == 13
  end

  it "parses users twitter handles from a txt file" do 
    tweet_parser.parse_names.should == ["alberta", "bob", "christie", "duncan", "emily", "farid"]
  end
end