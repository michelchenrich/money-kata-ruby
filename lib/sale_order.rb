class SaleOrder
  exposes :id, :customer, :currency
  
  def initialize id, customer, currency
    @id = id
    @customer = customer
    @currency = currency
    @items = []
  end

  def total
    items.map(&:price).sum.as_currency currency
  end

  def items
    @items 
  end

  def add_item product, quantity=1
    items << SaleOrderItem.new(product, quantity)
  end
end
