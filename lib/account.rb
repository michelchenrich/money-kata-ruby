class Account
  exposes :timeline
  
  def initialize
    @credits = Array.new
    @debits = Array.new
    @timeline = Array.new
  end

  def deposit money
    credits.push money.positive
    timeline.push_top money.positive
  end

  def average_deposit
    credits.average
  end

  def withdraw money
    debits.push money.positive
    timeline.push_top money.negative
  end

  def average_withdraw
    debits.average
  end

  def balance currency
    (credits.sum - debits.sum).as_currency currency 
  end

  private
  exposes :credits, :debits
end
