class Numeric
  also_responds_to message: :positive, with_method: :absolute
  also_responds_to message: :as_number, with_method: :itself

  def as_currency currency
    Money.new self, currency
  end

  def absolute
    positive?.
      if_true { self }.
      if_false { self * -1 }
  end

  def negative
    absolute * -1
  end

  def negated
    self * -1
  end
end
