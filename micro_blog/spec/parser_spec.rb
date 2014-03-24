require 'parser'

describe Parser do 

  let (:tweet_parser) {Parser.new('data/sample_input.txt')}

  before :each do 
    @parsed_file = tweet_parser.parse_file 
  end

  it "parses tweets" do 
    @parsed_file.count.should == 13
  end

  it "parses users twitter handles from a txt file" do 
    tweet_parser.parse_names.should == ["alberta", "bob", "christie", 
                                        "duncan", "emily", "farid"]
  end
end