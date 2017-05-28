describe Numeric do 
  context '#negative' do
    it 'converts itself to negative' do
      expect(1.negative).to eq -1
    end

    it 'remains negative when asked to be negative' do
      expect(-1.negative).to eq -1
    end
  end

  context '#negated' do
    it 'converts itself to negative when positive' do
      expect(1.negated).to eq -1
    end
    
    it 'converts itself to positive when negative' do
      expect(-1.negated).to eq 1
    end
  end

  context '#positive' do
    it 'converts itself to positive' do
      expect(-1.positive).to eq 1
    end

    it 'remains positive when asked to be positive' do
      expect(1.positive).to eq 1
    end
  end

  context '#absolute' do
    it 'returns the absolute value' do 
      expect(-1.absolute).to eq 1
    end
  end

  context '#as_currency' do
    it 'returns itself as amount in a given currency' do
      dollars = Currency.for_code 'USD'
      expect(10.0.as_currency(dollars)).to eq(dollars.amount(10.0))
    end
  end

  context '#as_number' do
    it 'returns itself' do
      expect(10.0.as_number).to eq 10.0
    end
  end
end
