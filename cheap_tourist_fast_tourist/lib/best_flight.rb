$: << File.expand_path(File.dirname(__FILE__) + "/../data/")

class BestFlight
  def initialize(sales_input_file)
    @sales_input_file = sales_input_file
  end

  def return_flights(file)
    file = File.readlines(file)
    @matches = file.select { |flight| flight.length > 2 }
  end

  def split_data
    @matches.map {|flight| flight.split(' ')}
  end
end