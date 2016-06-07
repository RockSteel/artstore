class Cart < ActiveRecord::Base
  has_many :cart_items
  has_many :items, through: :cart_items, source: :product

  def add_product_to_cart(product)
    self.items << product
  end

  def total_price
    self.items.reduce(0) { |acc, p| acc + p.price }
  end

  def clean!
    self.cart_items.destroy_all
  end
end
