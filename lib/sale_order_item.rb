class SaleOrderItem
  def initialize product, quantity
    @product = product
    @price = product.price
    @quantity = quantity
  end

  def product
    @product
  end

  def quantity
    @quantity
  end

  def price
    @price * quantity
  end
end
