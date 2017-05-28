class NilClass
  def as_currency currency
    0.0.as_currency currency
  end
  
  def + something
    something
  end

  def - something
    something.negated
  end
end
