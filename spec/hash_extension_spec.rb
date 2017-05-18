describe Hash do
  context '#get_if_absent_put' do
    context 'when key is present' do
      it 'returns the existing value' do
        expect({a: 1}.get_if_absent_put(:a) { 2 }).to eq 1
      end
    end

    context 'when key is absent' do
      it 'evaluates the block and adds the result' do
        hash = {a: 1}
        hash.get_if_absent_put(:b) { 2 }
        expect(hash[:b]).to eq 2
      end

      it 'returns the newly added value' do
        expect({a: 1}.get_if_absent_put(:b) { 2 }).to eq 2
      end
    end
  end
end
