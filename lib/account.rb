class Account
  def initialize
    @timeline = Array.new
  end

  def timeline
    @timeline
  end

  def deposit money
    timeline.push_top money.positive
  end

  def deposits
    timeline.select { |m| m.positive? }
  end

  def average_deposit
    deposits.average
  end

  def withdraw money
    timeline.push_top money.negative
  end

  def withdraws
    timeline.select { |m| m.negative? }
  end
  
  def average_withdraw
    withdraws.average
  end

  def balance currency
    timeline.sum.as_currency currency 
  end

  def average_entry
    timeline.average
  end
end
