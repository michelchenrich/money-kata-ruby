describe Account do
  let(:account) { Account.new }
  let(:dollars) { Currency.for_code 'USD' }
  let(:reals) { Currency.for_code 'BRL' }

  before do
    dollars.put_conversion_rate reals, 3.5
  end
  
  it 'has an initial balance of zero in a given currency' do
    expect(account.balance dollars).to eq(0.0.as_currency(dollars))
  end

  it 'receives deposits' do
    account.deposit 10.0.as_currency(dollars)
    expect(account.balance dollars).to eq(10.0.as_currency(dollars))
  end

  it 'receives negative deposits as absolute amounts' do
    account.deposit -10.0.as_currency(dollars)
    expect(account.balance dollars).to eq(10.0.as_currency(dollars))
  end

  it 'can be withdrawn from' do
    account.deposit 10.0.as_currency(dollars)
    account.withdraw 5.0.as_currency(dollars)
    expect(account.balance dollars).to eq(5.0.as_currency(dollars))
  end

  it 'withdraws absolute amounts' do
    account.deposit 10.0.as_currency(dollars)
    account.withdraw -5.0.as_currency(dollars)
    expect(account.balance dollars).to eq(5.0.as_currency(dollars))
  end

  it 'displays timeline by latest entry' do 
    account.deposit dollars.amount(10.0)
    account.withdraw dollars.amount(5.0)
    expect(account.timeline.to_s).to eq("[-5.0 USD, 10.0 USD]")
  end

  it 'converts foreign currencies when presenting balance' do
    account.deposit dollars.amount(10.0)
    account.deposit reals.amount(35.0)
    expect(account.balance dollars).to eq(dollars.amount(20.0))
  end
 
  it 'displays foreign currencies in timeline' do
    account.deposit dollars.amount(10.0)
    account.deposit reals.amount(35.0)
    expect(account.timeline.to_s).to eq("[35.0 BRL, 10.0 USD]")
  end
end
