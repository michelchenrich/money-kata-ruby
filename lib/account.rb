class Account
  exposes :timeline

  def initialize
    @timeline = Array.new
  end

  def deposit money
    timeline.push_top money.positive
  end

  def withdraw money
    timeline.push_top money.negative 
  end

  def balance currency
    timeline.sum.as_currency currency 
  end
end
