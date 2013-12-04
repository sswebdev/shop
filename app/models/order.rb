class Order < ActiveRecord::Base

  has_many :line_items
  has_many :products, through: :line_items

  def total
    self.products.sum(:price)
  end

  def add_product(product)
    line_item = LineItem.new
    line_item.order_id = self.id
    line_item.product_id = product.id
    line_item.save
    self.reload
  end
end
