describe 'Conditionals' do
  context 'with a true-like object' do
    it 'will evaluate the block in #if_true, returning it' do
      expect(true.if_true { 'Result' }).to eq 'Result'
    end

    it 'will not evaluate the block in #if_false, returning itself' do
      expect(true.if_false { 'Result' }).to eq true
    end

    it 'will return the result from true block in a chain with #if_true first' do
      expect(true.if_true { 'Result' }.if_false { 'Not Result'}).to eq 'Result'
    end

    it 'will return the result from true block in a chain #if_false first' do
      expect(true.if_false { 'Not Result' }.if_true { 'Result'}).to eq 'Result'
    end
  end

  context 'with a false-like object' do
    it 'will not evaluate the block in #if_true, returning itself' do
      expect(false.if_true { 'Result' }).to eq false 
    end

    it 'will evaluate the block in #if_false, returning it' do
      expect(false.if_false { 'Result' }).to eq 'Result'
    end

    it 'will return the result from false block in a chain with #if_true first' do
      expect(false.if_true { 'Not Result' }.if_false { 'Result' }).to eq 'Result'
    end

    it 'will return the result from true block in a chain #if_false first' do
      expect(false.if_false { 'Not Result' }.if_true { 'Result' }).to eq 'Result'
    end
  end
end
