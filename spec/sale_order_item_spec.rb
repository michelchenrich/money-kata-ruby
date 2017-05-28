describe SaleOrderItem do
  let(:dollars) { Currency.for_code 'USD' }
  let(:product) { double({price: 10.0.as_currency(dollars)}) }

  it 'has a product and a quantity' do 
    item = SaleOrderItem.new product, 1
    expect(item.product).to eq product
    expect(item.quantity).to eq 1
  end

  it 'freezes the product''s price upon creation' do
    item = SaleOrderItem.new product, 1    
    product = double({price: 11.0.as_currency(dollars)})
    expect(item.price).to eq(10.0.as_currency(dollars))
  end

  it 'multiplies the frozen price by the set quantity' do
    item = SaleOrderItem.new product, 2
    expect(item.price).to eq(20.0.as_currency(dollars))
  end
end
