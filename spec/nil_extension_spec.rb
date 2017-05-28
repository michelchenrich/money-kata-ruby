describe NilClass do
  context '#as_currency' do
    it 'returns zero amount in a given currency' do
      dollars = Currency.for_code 'USD'
      expect(nil.as_currency(dollars)).to eq(dollars.amount(0.0))
    end
  end

  context '#-' do
    it 'returns the subtracted value' do
      expect(nil - 10).to eq -10
    end
  end
end
