class Account
  exposes :timeline

  delegates message: :average_deposit, to: :deposits, with_method: :average
  delegates message: :average_withdraw, to: :withdraws, with_method: :average
  delegates message: :average_entry, to: :timeline, with_method: :average
  
  def initialize
    @timeline = Array.new
  end

  def deposit money
    timeline.push_top money.positive
  end

  def deposits
    timeline.select { |m| m.positive? }
  end

  def withdraw money
    timeline.push_top money.negative
  end

  def withdraws
    timeline.select { |m| m.negative? }
  end

  def balance currency
    timeline.sum.as_currency currency 
  end
end
