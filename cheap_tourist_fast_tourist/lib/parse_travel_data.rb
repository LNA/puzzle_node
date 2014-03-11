$: << File.expand_path(File.dirname(__FILE__) + "/../data/")

class ParseTravelData
  attr_accessor :flights
  def initialize(file_to_parse)
    @file = file_to_parse
  end

  def clean_data
    remove_extraneous_data
    split_travel_data
  end

  def remove_extraneous_data
    file = File.readlines(@file)
    @flights = file.select { |flight| flight.length > 5 }
  end

  def split_travel_data
    @flights = @flights.map {|flight| flight.split(' ')}
  end
end