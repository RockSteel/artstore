class Cart < ActiveRecord::Base
  has_many :cart_items
  has_many :items, through: :cart_items, source: :product

  def add_product_to_cart(product)
    ci = self.cart_items.build
    ci.product = product
    ci.save
  end
end
