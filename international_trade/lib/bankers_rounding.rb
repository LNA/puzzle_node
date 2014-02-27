class BankersRounding

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
end