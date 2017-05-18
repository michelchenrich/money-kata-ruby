describe Array do
  context 'sum' do
    it 'is nil with zero elements' do
      expect([].sum).to be_nil
    end
    
    it 'is the only element if there are no others' do
      expect([10].sum).to eq 10
    end

    it 'adds up the multiple elements' do
      expect([10, 10, 10].sum).to eq 30
    end
  end
end
