$: << File.expand_path(File.dirname(__FILE__) + "/../data/")

class BestFlight
  def initialize(sales_input_file)
    @sales_input_file = sales_input_file
  end

  def read_file
    File.open(@sales_input_file, "r") do |f|
      f.each_line do |line|
        puts line
      end
    end
  end

end