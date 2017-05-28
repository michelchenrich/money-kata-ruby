class Currency
  exposes :code, :rates
  also_responds_to message: :to_s, with_method: :code

  @instances = Hash.new

  def self.for_code code
    @instances.get_if_absent_put(code) { Currency.new code }
  end

  def initialize code
    @code = code
    @rates = Hash.new
  end

  def put_conversion_rate other_currency, rate
    rates[other_currency.to_s] = rate 
    other_currency.rates[to_s] = 1.0 / rate  
  end

  def get_conversion_rate other_currency
    rates[other_currency.to_s] || 1.0
  end

  def amount amount
    Money.new(amount, self)
  end
end
