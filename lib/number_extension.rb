class Numeric
  def as_currency currency
    Money.new self, currency
  end

  def positive
    absolute
  end

  def absolute
    positive? ? self : self * -1
  end

  def negative
    absolute * -1
  end
end
