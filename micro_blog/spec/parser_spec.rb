require 'parser'

describe Parser do 

  let (:tweet_parser) {Parser.new('data/sample_input.txt')}

  before :each do 
    @parsed_file = tweet_parser.parse_file 
  end

  it "parses tweets" do 
    @parsed_file.first.should == "alberta: @bob \"It is remarkable, the character of the pleasure we derive from the best books.\"\n"
  end

  it "parses users twitter handles from a txt file" do 
    tweet_parser.parse_names.should == ["alberta", "bob", "christie", 
                                        "duncan", "emily", "farid"]
  end
end