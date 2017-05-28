describe Array do
  context '#sum' do
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

  context '#push_top' do
    it 'adds the element to the first position' do
      expect([1, 2, 3].push_top(4)).to eq [4, 1, 2, 3]
    end
  end

  context '#average' do
    it 'is the sum of all elements divided by the count' do
      expect([1, 2, 3].average).to eq(2)
    end
  end
end
