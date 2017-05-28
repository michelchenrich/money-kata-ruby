describe SaleOrder do
  let(:dollars) { Currency.for_code 'USD' }
  let(:euros) { Currency.for_code 'EUR' }
  let(:customer) { double }

  it 'requires an ID, a customer, and a currency' do
    order = SaleOrder.new 'id', customer, dollars
    expect(order.id).to eq 'id'
    expect(order.customer).to eq customer
    expect(order.currency).to eq dollars
  end

  context 'when empty' do
    let(:order) { SaleOrder.new 'id', customer, dollars }

    it 'has an initial total of zero' do
      expect(order.total).to eq(0.0.as_currency(dollars))
    end

    it 'has zero items' do
      expect(order.items.count).to eq 0
    end
  end

  context 'when adding items' do
    let(:order) { SaleOrder.new 'id', customer, dollars }

    before do
      euros.put_conversion_rate dollars, 2.0
    end

    it 'adds the product''s price to the total' do
      product = double({price: 10.0.as_currency(dollars)})
      order.add_item product
      expect(order.total).to eq(10.0.as_currency(dollars)) 
    end

    it 'adds the product''s price multiplied by quantity to the total' do
      product = double({price: 10.0.as_currency(dollars)})
      order.add_item product, 2
      expect(order.total).to eq(20.0.as_currency(dollars)) 
    end

    it 'converts prices to order currency' do
      product = double({price: 10.0.as_currency(euros)})
      order.add_item product, 2
      expect(order.total).to eq(40.0.as_currency(dollars))
    end
    
    it 'only converts prices to order currency when calculating the total' do
      product = double({price: 10.0.as_currency(euros)})
      order.add_item product, 2
      euros.put_conversion_rate dollars, 3.0
      expect(order.total).to eq(60.0.as_currency(dollars))
    end
  end
end
