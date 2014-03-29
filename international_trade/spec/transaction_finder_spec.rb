describe TransactionFinder do 
  let (:parsed_csv_file) {FileParser.new.parse_csv_transactions('data/sample_trans.csv')}
  let (:finder) {TransactionFinder.new(parsed_csv_file, :DM1182)}

  it "outputs transactions for USD" do 
    finder.output_transactions_for_sku.should == [{:store=>:Yonkers, :sku=>:DM1182, :amount=>"19.68", :currency=>:AUD}, 
                                                  {:store=>:Nashua,  :sku=>:DM1182, :amount=>"58.58", :currency=>:AUD}, 
                                                  {:store=>:Camden,  :sku=>:DM1182, :amount=>"54.64", :currency=>:USD}]
  end
end