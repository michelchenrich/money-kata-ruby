class Money
  is_composed_of :amount, :currency

  specializes method: :apply, with_arguments: [':+'], to: :+
  specializes method: :apply, with_arguments: [':-'], to: :-
  specializes method: :apply_to_amount, with_arguments: [':*'], to: :*
  specializes method: :apply_to_amount, with_arguments: [':/'], to: :/

  delegates message: :positive?, to: :amount
  delegates message: :negative?, to: :amount
  delegates message: :get_conversion_rate, to: :currency

  also_responds_to message: :as_number, with_method: :amount
  also_responds_to message: :inspect, with_method: :to_s

  def negative
    currency.amount(amount.negative)
  end

  def positive
    currency.amount(amount.positive)
  end

  def as_currency other_currency
    other_currency.amount(amount * get_conversion_rate(other_currency))
  end

  def == other_money
    amount == other_money.amount && currency == other_money.currency
  end

  def to_s
    "#{ amount } #{ currency }"
  end

  private

  def apply operation, other_money
    converted_money = other_money.as_currency currency
    currency.amount(amount.send(operation, converted_money.amount))
  end

  def apply_to_amount operation, other_amount
    currency.amount(amount.send(operation, other_amount))
  end
end
