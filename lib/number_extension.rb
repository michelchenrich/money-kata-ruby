class Numeric
  def as_currency currency
    Money.new self, currency
  end

  def positive
    absolute
  end

  def absolute
    positive?.
      if_true { self }.
      if_false { self * -1 }
  end

  def negative
    absolute * -1
  end

  def as_number
    self
  end
end
