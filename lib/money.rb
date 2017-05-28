class Money
  def initialize amount, currency
    @amount = amount
    @currency = currency
  end

  def amount
    @amount
  end

  def currency
    @currency
  end

  def negative
    currency.amount(amount.negative)
  end

  def negative?
    amount.negative?
  end

  def positive
    currency.amount(amount.positive)
  end
  
  def positive?
    amount.positive?
  end

  def as_currency other_currency
    other_currency.amount(amount * get_conversion_rate(other_currency))
  end
   
  def as_number
    amount
  end

  def == other_money
    amount == other_money.amount && currency == other_money.currency
  end

  def to_s
    "#{ amount } #{ currency }"
  end

  def inspect
    to_s 
  end

  def + other_money
    apply :+, other_money
  end

  def - other_money
    apply :-, other_money
  end

  def * factor
    apply_to_amount :*, factor
  end

  def / factor
    apply_to_amount :/, factor
  end

  private

  def get_conversion_rate other_currency
    currency.get_conversion_rate other_currency 
  end

  def apply operation, other_money
    currency.amount(amount.send(operation, convert(other_money).amount))
  end

  def convert other_money
    other_money.as_currency currency
  end

  def apply_to_amount operation, other_amount
    currency.amount(amount.send(operation, other_amount))
  end
end
