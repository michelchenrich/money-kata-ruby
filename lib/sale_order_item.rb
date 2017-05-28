class SaleOrderItem
  exposes :product, :quantity

  def initialize product, quantity
    @product = product
    @price = product.price
    @quantity = quantity
  end

  def price
    @price * quantity
  end
end
