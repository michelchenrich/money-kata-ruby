describe NilClass do
  context '#as_currency' do
    it 'returns zero amount in a given currency' do
      dollars = Currency.for_code 'USD'
      expect(nil.as_currency(dollars)).to eq(0.0.as_currency(dollars))
    end
  end

  context '#-' do
    it 'returns the subtracted value as negative' do
      expect(nil - 10).to eq -10
    end

    it 'returns a negative subtracted value as positive' do 
      expect(nil - -10).to eq 10
    end
  end
  
  context '#+' do
    it 'returns the added value' do
      expect(nil + 10).to eq 10
    end
  end
end
