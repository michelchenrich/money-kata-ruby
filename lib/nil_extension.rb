class NilClass
  def as_currency currency
    0.0.as_currency currency
  end

  def - something
    something.negative
  end

  def negative
    self
  end
end
