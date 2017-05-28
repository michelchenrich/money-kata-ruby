class SaleOrder
  exposes :id, :customer, :currency, :items
  
  def initialize id, customer, currency
    @id = id
    @customer = customer
    @currency = currency
    @items = []
  end

  def total
    prices.sum.as_currency currency
  end

  def add_item product, quantity=1
    items.push SaleOrderItem.new(product, quantity)
  end
  
  def prices
    items.map(&:price)
  end
end
