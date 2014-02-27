class BankersRounding
  attr_accessor :number

  def initialize(number)
    @number = number
  end

  def is_a_floating_point_number?
    if @number.instance_of? Float
      true
    else
      false
    end
  end 

  def round_to_nearest_even_number
    @number =  (@number + 0.5).to_i
    if @number.even?
      return @number
    else
      @number = (@number - 0.5).to_i
    end
  end
end