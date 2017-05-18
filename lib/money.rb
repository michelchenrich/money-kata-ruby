class Money
  exposes :amount, :currency
  
  def initialize amount, currency
    @amount = amount
    @currency = currency
  end

  def negative
    Money.new(amount.negative, currency)
  end

  def positive
    Money.new(amount.positive, currency)
  end

  def as_currency other_currency
    currency == other_currency ? 
      self :
      Money.new(amount * (currency.get_conversion_rate other_currency), other_currency)
  end

  def == other_money
    self.amount == other_money.amount && self.currency == other_money.currency
  end

  def + other_money
    converted_money = other_money.as_currency self.currency
    Money.new(self.amount + converted_money.amount, currency)
  end

  def inspect
    to_s
  end

  def to_s
    "#{ amount } #{ currency }"
  end
end
