describe Money do
  let(:dollars) { Currency.for_code 'USD' }
  let(:euros) { Currency.for_code 'EUR' }

  before do
    dollars.put_conversion_rate euros, 0.5
  end

  it 'is composed by an amount and a currency' do
    ten_dollars = Money.new 10.0, dollars
    expect(ten_dollars.inspect).to eq('10.0 USD')
  end

  it 'equals another money with same amount and currency' do
    expect(Money.new(10.1, dollars)).not_to eq(Money.new(10.0, dollars))
    expect(Money.new(10.0, euros)).not_to eq(Money.new(10.0, dollars))
    expect(Money.new(10.0, dollars)).to eq(Money.new(10.0, dollars))
  end

  it 'can be converted to another currency' do
    ten_dollars = Money.new 10.0, dollars
    five_euros = ten_dollars.as_currency euros
    expect(five_euros.to_s).to eq('5.0 EUR')
  end

  it 'can be added more amounts' do
    ten_dollars = Money.new 10.0, dollars
    twenty_dollars = Money.new 20.0, dollars
    expect(ten_dollars + 10.0).to eq(twenty_dollars)
  end

  it 'can be added another money' do
    ten_dollars = Money.new 10.0, dollars
    twenty_dollars = Money.new 20.0, dollars
    expect(ten_dollars + ten_dollars).to eq(twenty_dollars)
  end
  
  it 'converts to augent currency when adding another currency' do
    ten_dollars = Money.new 10.0, dollars
    five_euros = Money.new 5.0, euros
    twenty_dollars = Money.new 20.0, dollars
    expect(ten_dollars + five_euros).to eq(twenty_dollars)
  end
  
  it 'can be instantiated by from the currency' do
    expect(dollars.amount(10.0)).to eq(Money.new(10.0, dollars))
  end

  it 'can be instantiated by converting a number to a currency' do
    expect(10.0.as_currency(dollars)).to eq(Money.new(10.0, dollars))
  end
end
