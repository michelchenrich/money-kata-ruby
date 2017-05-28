describe Currency do
  it 'is represented by the ISO code' do
    expect(Currency.for_code('BRL').to_s).to eq 'BRL'
  end

  it 'has a conversion rate to self of 1.0' do
    dollar = Currency.for_code 'USD'
    expect(dollar.get_conversion_rate(dollar)).to eq 1.0
  end

  it 'stores conversion rates to other currency' do
    dollar = Currency.for_code 'USD'
    euro = Currency.for_code 'EUR'
    dollar.put_conversion_rate euro, 2.0
    expect(dollar.get_conversion_rate(euro)).to eq 2.0
  end

  it 'stores the reverse conversion rate' do
    dollar = Currency.for_code 'USD'
    euro = Currency.for_code 'EUR'
    dollar.put_conversion_rate euro, 2.0
    expect(euro.get_conversion_rate(dollar)).to eq 0.5 
  end

  it 'can only have one instance per ISO code' do 
    expect(Currency.for_code('USD')).to equal(Currency.for_code('USD'))
  end
end
